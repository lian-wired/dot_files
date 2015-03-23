;; color-moccur.el
;; from emacswiki
 (when (require 'color-moccur nil t)
   ;; M-o にoccur-by-moccur を割り当て
   (define-key global-map (kbd "M-o") 'occur-by-moccur)
   ;; スペース区切りでAND検索
   (setq moccur-split-word t)
   ;; ディレクトリ検索のとき除外するファイル
   (add-to-list 'dmoccur-exclusion-mask "\\.DS_Store")
   (add-to-list 'dmoccur-exclusion-mask "^#.+#$"))
;; Migemo を使う
;;   (when (and (executable-find "cmigemo")
;;              (require 'migemo nil t))
;;     (setq moccur-use-migemo t)))

;; moccur-edit
;; from emacswiki
(require 'moccur-edit nil t)
;; moccur-edit後にファイルを保存
(defadvice moccur-edit-change-file
   (after save-after-moccur-edit-buffer activate)
   (save-buffer))
