(ns status-im.tribute-to-talk.core
  (:refer-clojure :exclude [remove])
  (:require [clojure.string :as string]
            [status-im.i18n :as i18n]
            [status-im.accounts.update.core :as accounts.update]
            [re-frame.core :as re-frame]
            [taoensso.timbre :as log]
            [status-im.ui.screens.wallet.choose-recipient.events :as choose-recipient.events]
            [status-im.ui.screens.wallet.db :as wallet.db]
            [status-im.utils.ethereum.core :as ethereum]
            [status-im.utils.ethereum.tokens :as tokens]
            [status-im.utils.money :as money]
            [status-im.contact.db :as contact]
            [status-im.utils.ethereum.core :as ethereum.core]
            [status-im.utils.ethereum.tribute :as ethereum.tribute]
            [status-im.ui.screens.navigation :as navigation]
            [status-im.utils.fx :as fx]))

(fx/defn mark-ttt-as-seen
  [{:keys [db] :as cofx}]
  (let [settings (get-in db [:account/account :settings])
        {:keys [seen?]} (:tribute-to-talk settings)]
    (when-not seen?
      (fx/merge cofx
                {:db (assoc db :tribute-to-talk/seen? true)}
                (accounts.update/update-settings
                 (assoc-in settings [:tribute-to-talk :seen?] true) {})))))

(fx/defn open-settings
  [{:keys [db] :as cofx}]
  (let [snt-amount (get-in db [:account/account :settings :tribute-to-talk :snt-amount])]
    (fx/merge cofx
              mark-ttt-as-seen
              (navigation/navigate-to-cofx :tribute-to-talk
                                           (if snt-amount
                                             {:step :edit
                                              :editing? true}
                                             {:step :intro})))))

(fx/defn set-step
  [{:keys [db]} step]
  {:db (assoc-in db [:navigation/screen-params :tribute-to-talk :step] step)})

(fx/defn open-learn-more
  [cofx]
  (set-step cofx :learn-more))

(fx/defn step-back
  [cofx]
  (let [{:keys [step editing?]}
        (get-in cofx [:db :navigation/screen-params :tribute-to-talk])]
    (case step
      (:intro :edit)
      (navigation/navigate-back cofx)

      (:learn-more :set-snt-amount)
      (set-step cofx (if editing?
                       :edit
                       :intro))

      :personalized-message
      (set-step cofx :set-snt-amount)

      :finish
      (set-step cofx :personalized-message))))

(fx/defn step-forward
  [cofx]
  (let [{:keys [step editing?]}
        (get-in cofx [:db :navigation/screen-params :tribute-to-talk])]
    (case step
      :intro
      (set-step cofx :set-snt-amount)

      :set-snt-amount
      (set-step cofx :personalized-message)

      :personalized-message
      (let [account-settings (get-in cofx [:db :account/account :settings])]
        (fx/merge cofx
                  (set-step (if editing?
                              :edit
                              :finish))
                  (accounts.update/update-settings
                   account-settings
                   {})))

      :finish
      (navigation/navigate-back cofx))))

(defn get-new-snt-amount
  [snt-amount numpad-symbol]
  ;; TODO: Put some logic in place so that incorrect numbers can not
  ;; be entered
  (let [snt-amount  (or snt-amount "0")]
    (if (= numpad-symbol :remove)
      (let [len (count snt-amount)
            s (subs snt-amount 0 (dec len))]
        (cond-> s
          ;; Remove both the digit after the dot and the dot itself
          (string/ends-with? s ".") (subs 0 (- len 2))
          ;; Set default value if last digit is removed
          (string/blank? s) (do "0")))
      (cond
        ;; Disallow two consecutive dots
        (and (string/includes? snt-amount ".") (= numpad-symbol "."))
        snt-amount
        ;; Disallow more than 2 digits after the dot
        (and (string/includes? snt-amount ".")
             (> (count (second (string/split snt-amount #"\."))) 1))
        snt-amount
        ;; Replace initial "0" by the first digit
        (and (= snt-amount "0") (not= numpad-symbol "."))
        (str numpad-symbol)
        :else (str snt-amount numpad-symbol)))))

(fx/defn update-snt-amount
  [{:keys [db]} numpad-symbol]
  {:db (update-in db [:account/account :settings :tribute-to-talk :snt-amount]
                  #(get-new-snt-amount % numpad-symbol))})

(fx/defn update-message
  [{:keys [db]} message]
  {:db (assoc-in db [:account/account :settings :tribute-to-talk :message]
                 message)})

(fx/defn start-editing
  [{:keys [db]}]
  {:db (assoc-in db [:navigation/screen-params :tribute-to-talk]
                 {:step :set-snt-amount
                  :editing? true})})

(defn remove
  [{:keys [db] :as cofx}]
  (let [account-settings (get-in db [:account/account :settings])]
    (fx/merge cofx
              {:db (assoc-in db [:navigation/screen-params :tribute-to-talk]
                             {:step :finish})}
              (accounts.update/update-settings
               (assoc account-settings :tribute-to-talk {:seen? true}) {}))))

(fx/defn check-tribute [{:keys [db] :as cofx} identity]
  (when (and (not (get-in db [:chats identity :group-chat]))
             (not (contact/whitelist? (get-in db [:contacts/contacts identity]))))
    (let [network (get-in db [:account/account :networks (:network db)])
          contract (get ethereum.tribute/contracts (ethereum.core/network->chain-keyword network))
          cb #(re-frame/dispatch [:tribute-to-talk.ui/set-tribute identity %1])]
      (ethereum.tribute/get-tribute (:web3 db) contract identity cb)))
  {:db db})

(fx/defn mark-tribute-as-paid [{:keys [db] :as cofx} identity]
  {:db (update-in db [:contacts/contacts identity :system-tags]
                  #(conj % :tribute-to-talk/paid))})

(defn status-label [{:keys [system-tags tribute]}]
  (cond (contains? system-tags :ttt/paid)
        (i18n/label :t/tribute-state-paid)
        ;(= status :pending)
        ;(i18n/label :t/tribute-state-pending)
        (pos? tribute)
        (i18n/label :t/tribute-state-required {:snt-amount tribute})
        :else nil))

(defn- transaction-details [contact symbol]
  (-> contact
      (select-keys [:name :address :public-key])
      (assoc :symbol symbol
             :gas (ethereum/estimate-gas symbol)
             :from-chat? true)))

(fx/defn pay-tribute [{:keys [db] :as cofx} identity]
  (let [recipient-contact     (get-in db [:contacts/contacts identity])
        sender-account        (:account/account db)
        chain                 (keyword (:chain db))
        amount (str (:tribute recipient-contact))
        symbol-param          :SNT
        _ (log/warn "#1")
        all-tokens            (:wallet/all-tokens db)
        {:keys [symbol decimals]} (tokens/asset-for all-tokens chain symbol-param)
        _ (log/warn "#2" amount decimals)
        {:keys [value error]}     (wallet.db/parse-amount amount decimals)
        _ (log/warn "#3")
        next-view-id              (if (:wallet-set-up-passed? sender-account)
                                    :wallet-send-transaction-modal
                                    :wallet-onboarding-setup)
        _ (log/warn "#pay-tribute let")]
    (fx/merge cofx
              {:db (-> db
                       (update-in [:wallet :send-transaction]
                                  assoc
                                  :amount (money/formatted->internal value symbol decimals)
                                  :amount-text amount
                                  :amount-error error)
                       (choose-recipient.events/fill-request-details
                        (transaction-details recipient-contact symbol) false)
                       (update-in [:wallet :send-transaction]
                                  dissoc :id :password :wrong-password?))
               :update-gas-price {:web3          (:web3 db)
                                  :success-event :wallet/update-gas-price-success
                                  :edit?         false}}
              (navigation/navigate-to-cofx next-view-id {}))))

#_(defn filter-message [cofx tx-id chat-id]
    (and (= (:message-type this) :user-message)
         (or (is-valid-tx? chat-id (:tribute-tx-id (:content this)))
             (whitelist? (:content this)))))
