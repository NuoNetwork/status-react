(ns status-im.ipfs.core
  (:refer-clojure :exclude [cat])
  (:require [status-im.utils.fx :as fx]
            [status-im.constants :as constants]))

(fx/defn cat
  [cofx {:keys [hash on-success on-failure]}]
  {:http-raw-get (cond-> {:url (str constants/ipfs-cat-url hash)
                          :timeout-ms 5000
                          :success-event-creator
                          (fn [{:keys [status body]}]
                            (if (= 200 status)
                              (on-success {:value body})
                              (when on-failure
                                (on-failure {:value status}))))}
                   on-failure
                   (assoc :failure-event-creator on-failure))})

(defn- parse-json [o]
  (when o
    (js->clj (js/JSON.parse o) :keywordize-keys true)))

(defn- parse-ipfs-add-response [res]
  (let [{:keys [Name Hash Size]} (parse-json res)]
    {:name Name
     :hash Hash
     :size Size}))

(fx/defn add
  [cofx {:keys [value on-success on-failure]}]
  (let [formdata (doto (js/FormData.)
                   ;; the key is ignored so there is no need to provide one
                   (.append nil value))]
    {:http-raw-post (cond-> {:url  constants/ipfs-add-url
                             :body formdata
                             :timeout-ms 5000
                             :success-event-creator
                             (fn [{:keys [status body]}]
                               (if (= 200 status)
                                 (on-success {:value (parse-ipfs-add-response body)})
                                 (when on-failure
                                   (on-failure {:value status}))))}
                      on-failure
                      (assoc :failure-event-creator on-failure))}))
