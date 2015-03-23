;;history

;; 最近使ったファイルをメニューに表示
;; (auto-install-from-emacswiki "recentf-ext.el")
;; (require 'recentf-ext)
;; (recentf-mode t)

;; 最近使ったファイルの表示数
;;(setq recentf-max-menu-items 10)

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

;; ファイルを自動保存
;;download-from http://homepage3.nifty.com/oatu/emacs/archives/auto-save-buffers.el
(require 'auto-save-buffers)
(run-with-idle-timer 2 t 'auto-save-buffers)

;; backupを作成しない
(setq make-backup-files nil)

;; 編集中ファイルのバックアップ間隔（秒）
(setq auto-save-timeout 15)

;; 編集中ファイルのバックアップ間隔（打鍵）
(setq auto-save-interval 60)

;; 編集中ファイルのバックアップ先 ~/.emacs.d/backups/
(setq auto-save-file-name-transforms
      `((".*" ,"~/.emacs.d/backups/" t)))

;; バックアップファイルの作成場所 ~/.emacs.d/backups/
(setq backup-directory-alist
      (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/backups"))
            backup-directory-alist))

;; バックアップ世代数
;; (setq kept-old-versions 1)
;; (setq kept-new-versions 2)

;; 古いバックアップファイルの削除
;; (setq delete-old-versions t)

