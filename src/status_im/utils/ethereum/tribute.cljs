(ns status-im.utils.ethereum.tribute
  (:require [status-im.utils.ethereum.core :as ethereum]
            [taoensso.timbre :as log]
            [status-im.utils.ethereum.abi-spec :as abi-spec]))

(def contracts
  {:mainnet nil
   :testnet "0x91a5895d0f55d407b7770873172f6b467c9a14de"
   :rinkeby nil})

(defn set-tribute [web3 contract public-key snt-amount]
  (ethereum/call web3
                 (ethereum/call-params contract "setRequiredTribute(uint256)" (ethereum/int->hex snt-amount))
                 (fn [& params]
                   (log/warn "#set-tribute cb:" params))))

(defn get-tribute [web3 contract public-key cb]
  (log/warn "### entering eth/get-tribute" contract public-key)
  #_(js/setTimeout #(cb 250) 2000)
  (ethereum/call web3
                 (ethereum/call-params contract "getFee(address)" public-key)
                 (fn [_ tribute]
                   (cb (ethereum/hex->int tribute)))))
