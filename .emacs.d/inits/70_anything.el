;;anything
;; ------------------------------------------------------------------------
(require 'anything-startup)
(setq anything-idle-delay 0.1)
(setq anything-input-idle-delay 0.1)
(setq anything-candidate-number-limit 50)
(setq anything-quick-update t)
(setq anything-enable-shortcuts 'alphabet)
(define-key global-map (kbd "M-y") 'anything-show-kill-ring)
(define-key global-map (kbd "C-:") 'anything-filelist+)
(setq descbinds-anything-window-style 'split-window)
(add-to-list 'descbinds-anything-source-template '(candidate-number-limit . 150))

;; (when (require 'anything nil t)
;;   (setq
;;    ;; 候補を表示するまでの時間.default=0.5
;;    anything-idle-delay 0.3
;;    ;; タイプして再描写するまでの時間. default=0.1
;;    anything-input-idle-delay 0.2
;;    ;; 候補の最大表示数. default=50
;;    anything-candidate-number-limit 100
;;    ;; 候補が多い時に体感速度を速くする
;;    anything-quick-update t
;;    ;;候補選択ショートカットをアルファベットに
;;    anything-enable-shortcuts 'alphabet)

;;   (require 'anything-match-plugin nil t)

;;   (when (and (executable-find "cmigemo")
;;              (require 'migemo nil t))
;;     (rewuire 'anything-migemo nil t))

;;   (when (require 'anything-complete nil t)
;;     ;; lispシンボルの補完候補の再検索時間
;;     (anything-lisp-complete-symbol-set-timer 150))

;;   (require 'anything-show-completion nil t)

;;   (when (require 'auto-install nil t)
;;     (require 'anything-auto-install nil t))

;;   (when (require 'descbinds-anything nil t)
;;     ;; describe-bindingsをAnythingに置き換える
;;     (descbinds-anything-install)))

;; anything-show-kill-ring

;; ;; anything-rurima.el
;; (require 'anything-rurima)
;; (setq anything-rurima-index-file "~/compile/rurima/rubydoc/rurima.e")


;; anything-c-moccur.el
;; http://svn.coderepos.org/share/lang/elisp/anything-c-moccur/trunk/anything-c-moccur.el
(require 'anything-c-moccur)
(when (require 'anything-c-moccur nil t)
  (setq
   ;; anything-c-moccur用 `anything-idle-delay'
   anything-c-moccur-anything-idle-delay 0.1
   ;; バッファの情報をハイライト
   anything-c-moccur-highligt-info-line-flag t
   ;; 現在選択中の候補の位置をほかのwindowに表示
   anything-c-moccur-enable-auto-look-flag t
   ;; 起動時にポイントの位置の単語を初期パターンにする
   anything-c-moccur-enable-initial-pattern t)
  ;; C-M-oにanything-c-moccur-occur-by-moccurを割り当て
  (global-set-key (kbd "C-M-o") 'anything-c-moccur-occur-by-moccur))


