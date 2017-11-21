;; customize-themes
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (deeper-blue)))
 '(custom-safe-themes (quote ("283c87234b7df63a8b0ec7653a1693439e9f8e6942bd32c8b277ed66b06af074" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; cursor-color
(set-cursor-color "red")
;; (add-hook 'input-method-activate-hook
;;           (lambda() (set-cursor-color "green")))
;; (add-hook 'input-method-inactivate-hook
;;           (lambda() (set-cursor-color "red")))

;; font
(add-to-list 'default-frame-alist '(font . "ricty-13"))

;; 基本インデントを2に
(setq-default c-basic-offset 2)

;; ファイル内のカーソル位置を記憶
(setq-default save-place t)
(require 'saveplace)

;; ダイアログボックスを使わないようにする
(setq use-dialog-box nil)
(defalias 'message-box 'message)

;; キーストロークをエコーエリアに速く表示
(setq echo-keystrokes 0.1)



;; フレームタイトルの設定
(setq frame-title-format
      (format "%%f - Emacs@%s" (system-name)))

;; ツールバーとスクロールバーを消す
(tool-bar-mode -1)
(scroll-bar-mode -1)


;; バッファ画面外文字の切り詰め表示
(setq truncate-lines nil)

;; ウィンドウ縦分割時のバッファ画面外文字の切り詰め表示
(setq truncate-partial-width-windows t)

;; C-c lで折り返しon/off
(defun toggle-truncate-partial-windows ()
  "折り返し表示をトグル動作します."
  (interactive)
  (if truncate-partial-width-windows
      (setq truncate-partial-width-windows nil)
    (setq truncate-partial-width-windows t))
  (recenter))
(global-set-key (kbd "C-c l") 'toggle-truncate-partial-windows)

;; バッファ中の行番号表示
(global-linum-mode t)
(set-face-attribute 'linum nil
        :height 0.9
        :foreground "#ccc")
(setq linum-format "%4d")

;; modelineに行・列の番号を表示
(line-number-mode t)
(column-number-mode t)

;; 行数の割合表示
;; (defvar my-lines-page-mode t)
;; (defvar my-mode-line-format)
;; (when my-lines-page-mode
;;   (setq my-mode-line-format "%d")
;;   (if size-indication-mode
;;       (setq my-mode-line-format (concat my-mode-line-format " of %%l")))
;;   (cond ((and (eq line-number-mode t) (eq column-number-mode t))
;;          (setq my-mode-line-format (concat my-mode-line-format " ((%%l, %%c)")))
;;         ((eq line-number-mode t)
;;          (setq my-mode-line-format (concat my-mode-line-format " L%%l")))
;;          ((eq column-number-mode t)
;; (setq my-mode-line-format (concat my-mode-line-format " C%%c")))))
;; (setq mode-line-position
;;       '(:eval (format my-mode-line-format
;;                       (count-lines (point-max) (point-min)))))

;; 時刻の表示
(require 'time)
(setq display-time-24hr-format t)
(setq display-time-string-forms '(24-hours ":" minutes))
(display-time-mode t)

;; カーソル点滅表示
(blink-cursor-mode 0)

;; 現在行のハイライト
(defface hlline-face
  '((((class color)
      (background dark))
     (:background "dark slate gray"))
    (((class color)
      (background light))
     (:background  "#98FB98"))
    (t
     ()))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)
(global-hl-line-mode)


;; スクロール時のカーソル位置の維持
(setq scroll-preserve-screen-position t)

;; スクロール行数（一行ごとのスクロール）
(setq vertical-centering-font-regexp ".*")
(setq scroll-conservatively 35)
(setq scroll-margin 0)
(setq scroll-step 1)

;; 画面スクロール時の重複行数
(setq next-screen-context-lines 1)

;; 括弧の範囲内を強調表示
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'expression)
(set-face-background 'show-paren-match-face "#500")

;; 選択領域の色
(set-face-background 'region "#00c")

;; 行末の空白を強調表示
(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace "#b12770")


;; タブをスペースで扱う
(setq-default indent-tabs-mode nil)
(custom-set-variables '(tab-width 2))

;; 起動メッセージの非表示
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;; スタートアップ時のエコー領域メッセージの非表示
(setq inhibit-startup-echo-area-message -1)

;; yes or no => y or n
(fset 'yes-or-no-p 'y-or-n-p)

;; フレームの透明度
(add-to-list 'default-frame-alist '(alpha . 85))
(set-frame-parameter nil 'alpha 85)

;; 画像ファイルを表示
(auto-image-file-mode t)

