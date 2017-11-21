;;history

;; 最近使ったファイルをメニューに表示
(setq recentf-max-saved-items 500)
;; 最近使ったファイルに加えないファイルを
;; 正規表現で指定する
(setq recentf-exclude
      '("/TAGS$" "/var/tmp/"))
(require 'recentf-ext)

;; 最近使ったファイルの表示数
(setq recentf-max-menu-items 10)

;; 最近使ったファイルの保存数
;;(setq recentf-max-saved-items 3000)

;; ミニバッファの履歴を保存する
(savehist-mode 1)

;; ミニバッファの履歴の保存数を増やす
(setq history-length 10000)

;; undohist
;; gitと干渉しそうなのでコメントアウト
;; (auto-install-from-url "http://cx4a.org/pub/undohist.el")
;;(require 'undohist nil t)
;;(undohist-initialize)

;; undo-tree
;;(package-install 'undo-tree)
(require 'undo-tree)
(global-undo-tree-mode)

;; backupを作成しない
(setq make-backup-files nil)

(require 'real-auto-save)
(setq real-auto-save-interval 3)        ;3秒後に自動保存
;; (add-hook 'prog-mode-hook 'real-auto-save-mode)
(add-hook 'find-file-hook 'real-auto-save-mode)

