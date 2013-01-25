;;------------------------------------------------------------------------
;; 言語と文字コードの指定
;;------------------------------------------------------------------------
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8-unix)
;;(setq default-file-name-coding-system 'utf-8)
(setq default-file-name-coding-system 'cp932)
(set-keyboard-coding-system 'utf-8)
;;(set-keyboard-coding-system 'cp932)
;;(set-selection-coding-system 'utf-16le-dos)
;; ファイル名の設定
(set-file-name-coding-system 'utf-8)

;;(setq locale-coding-system 'utf-8)
;;(setq default-process-coding-system '(cp932 . cp932))

;; IME
(setq default-input-method "W32-IME")
(setq-default w32-ime-mode-line-state-indicator "[Aa]")
(setq w32-ime-mode-line-state-indicator-list '("[Aa]" "[あ]" "[Aa]"))
(w32-ime-initialize)

;; IME OFF時の初期カーソルカラー
(set-cursor-color "red")

;; IME ON/OFF時のカーソルカラー
(add-hook 'input-method-activate-hook
          (lambda() (set-cursor-color "green")))
(add-hook 'input-method-inactivate-hook
          (lambda() (set-cursor-color "red")))

   ;; バッファ切り替え時にIME状態を引き継ぐ
(setq w32-ime-buffer-switch-p nil)

;; フォントの設定
(set-face-attribute 'default nil
                    :family "Ricty"
                    :height 130)

;; 基本インデントを2に
(setq-default c-basic-offset 2)

;; find-functionをキー割り当てする
(find-function-setup-keys)

;;------------------------------------------------------------------------
;; load-pathの追加
;;------------------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/auto-install/")
(setq load-path (cons "~/.emacs.d/elpa" load-path))

;; ~/.emacs.d/elisp/以下のフォルダをすべて読み込む
(let ((default-directory (expand-file-name "~/.emacs.d/elisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

;; auto-install
(require 'auto-install)
;;(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)
(require 'ediff)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; ELPA/Marmaladeパッケージの設定
(require 'package)
;;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/"))
(package-refresh-contents)
(package-initialize)

;; infoを追加
(add-to-list 'Info-default-directory-list "~/.emacs.d/info/")
;;------------------------------------------------------------------------

;; ファイル内のカーソル位置を記憶
(setq-default save-place t)
(require 'saveplace)

;; GCを減らす
(setq gc-cons-threshold (* 100 gc-cons-threshold))

;; ログの記録行数を増やす
(setq message-log-max 10000)

;; ダイアログボックスを使わないようにする
(setq use-dialog-box nil)
(defalias 'message-box 'message)

;; キーストロークをエコーエリアに速く表示
(setq echo-keystrokes 0.1)

;;;試行錯誤用ファイルを開くための設定
(require 'open-junk-file)

;; C-x C-zで試行錯誤ファイルを開く
(global-set-key (kbd "C-z") 'open-junk-file)

;;;式の評価結果を注釈するための設定
(require 'lispxmp)

;; emacs-lisp-modeでC-c C-dを押すと注釈される
(define-key emacs-lisp-mode-map (kbd "C-c C-d") 'lispxmp)

;;;括弧の対応を保持して編集する設定
(require 'paredit)
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-mode-hook 'enable-paredit-mode)
(add-hook 'ielm-mode-hook 'enable-paredit-mode)

;;自動バイトコンパイルを無効にするファイル名の正規表現
(require 'auto-async-byte-compile)
(setq auto-async-byte-compile-exclude-files-regexp "/junk/")
;;(setq auto-async-byte-compile-exclude-files-regexp "init.el")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)

;; エコーエリアにEmacs Lispのヘルプを表示
(require 'eldoc)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
(setq eldoc-idle-delay 0.2) ;すぐに表示したい
(setq eldoc-minor-mode-string "") ;モードラインにElDocと表示しない

;; find-functionをキー割り当てする
(find-function-setup-keys)

;; color-theme
(require 'color-theme nil t)
  (color-theme-initialize)
  (color-theme-arjen)

;; ruby-mode
;; (package-install 'ruby-mode)
 (autoload 'ruby-mode "ruby-mode"
   "Mode for editing ruby source files" t)
(setq auto-mode-alist
      (append '(
                ("\\.rb$" . ruby-mode)
                ("\\.thor$" . ruby-mode)
                ("\\.ru$" . ruby-mode)) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
                                     interpreter-mode-alist))

;; indent調整
(setq ruby-deep-indent-paren-style nil)
(defadvice ruby-indent-line (after unindent-closing-paren activate)
  (let ((column (current-column))
        indent offset)
    (save-excursion
      (back-to-indentation)
      (let ((state (syntax-ppss)))
        (setq offset (- column (current-column)))
        (when (and (eq (char-after) ?\))
                   (not (zerop (car state))))
          (goto-char (cadr state))
          (setq indent (current-indentation)))))
    (when indent
      (indent-line-to indent)
      (when (> offset 0) (forward-char offset)))))

;; endを自動補完
(defun ruby-insert-end()
  (interactive)
  (insert "end")
  (ruby-indent-line t)
  (end-of-line))

;; ruby-electric
;; (package-install 'ruby-electric)
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))

;; inf-ruby
;; (package-install 'inf-ruby)
(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook
    '(lambda () (inf-ruby-keys)))

;; ruby-block
;;(auto-install-from-emacswiki "ruby-block")
(require 'ruby-block)
(add-hook 'ruby-mode-hook '(lambda () (ruby-block-mode t)))
(setq ruby-block-highlight-toggle t)
(ruby-block-mode t)

;;  flymake for ruby
;; (package-install 'flymake)
;; (package-install 'flymake-ruby)
(require 'flymake)
(require 'flymake-ruby)
(set-face-background 'flymake-errline "red4")
(set-face-background 'flymake-warnline "dark slate blue")
(defun flymake-ruby-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-with-folder-structure))
         (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "ruby" (list "-c" local-file))))
;; Invoke ruby with '-c' to get syntax checking
(push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3) flymake-err-line-patterns)

(add-hook 'ruby-mode-hook '(lambda ()
    ;; Don't want flymake mode for ruby regions in rhtml files
    (if (not (null buffer-file-name)) (flymake-mode))))

;; rhtml-mode
;; Downloaded from github https://github.com/eschulte/rhtml

(require 'rhtml-mode)
(setq auto-mode-alist
      (append '(
                ("\\.erubis$" . rhtml-mode)
                ("\\.erb$" . rhtml-mode)) auto-mode-alist))

;; web-mode
;; (auto-install-from-url "https://raw.github.com/fxbois/web-mode/master/web-mode.el")
;; (require 'web-mode)
;; (when (< emacs-major-version 24)
;;   (defalias 'prog-mode 'fundamental-mode))
;; (defun web-mode-hook ()
;;   "Hooks for Web mode."
;;   (setq web-mode-html-offset   2)
;;   (setq web-mode-css-offset    2)
;;   (setq web-mode-script-offset 2)
;;   (setq web-mode-php-offset    2)
;;   (setq web-mode-java-offset   2)
;;   (setq web-mode-asp-offset    2))
;; (add-hook 'web-mode-hook 'web-mode-hook)
;; (add-to-list 'auto-mode-alist '("\\.erubis\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))


;;---------------------------------------------------------------------
;; js2-mode
;; downloaded from github "git://github.com/mooz/js2-mode.git"
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(setq js2-indent-on-enter-key t)
(setq js2-enter-indents-newline t)
(setq js2-basic-offset 2)


;; fly-jshint-wsh
;;(package-install 'fly-jshint-wsh)
(defun my-javascript-mode-fn ()
  (require 'fly-jshint-wsh)
  (setq flyjs-checker 'jslint) ;; jshint is the default
  (flymake-mode 1)
  )
(add-hook 'js2-mode-hook 'my-javascript-mode-fn)

;; flymakeのエラーメッセージをC-c dで表示
(defun flymake-show-and-sit ()
  "Displays the error/warning for the current line in the minibuffer"
  (interactive)
  (progn
    (let* ((line-no (flymake-current-line-no) )
           (line-err-info-list (nth 0 (flymake-find-err-info flymake-err-info line-no)))
           (count (length line-err-info-list)))
      (while (> count 0)
        (when line-err-info-list
          (let* ((file (flymake-ler-file (nth (1- count) line-err-info-list)))
                 (full-file
                  (flymake-ler-full-file (nth (1- count) line-err-info-list)))
                 (text (flymake-ler-text (nth (1- count) line-err-info-list)))
                 (line (flymake-ler-line (nth (1- count) line-err-info-list))))
            (message "[%s] %s" line text)))
        (setq count (1- count)))))
  (sit-for 60.0))
(global-set-key "\C-cd" 'flymake-show-and-sit)

;; コード中のブロックを折り畳む
;;(auto-install-from-url "http://www.dur.ac.uk/p.j.heslin/Software/Emacs/Download/fold-dwim.el")
(require 'hideshow)
(require 'fold-dwim)


;;---------------------------------------------------------------------
;; sass-mode
(require 'sass-mode)
(add-to-list 'auto-mode-alist '("\\.sass\\'" . sass-mode))


;;------------------------------------------------------------------------
;; Evernote-Emacs-Mode
;;------------------------------------------------------------------------
;; Downloaded from http://code.google.com/p/emacs-evernote-mode/
(require 'evernote-mode)
(setq evernote-username "lian_li") ; optional: you can use this username as default.
(setq evernote-enml-formatter-command '("-dump" "-I" "UTF8" "-O" "UTF8")) ; optional
(global-set-key "\C-cec" 'evernote-create-note)
(global-set-key "\C-ceo" 'evernote-open-note)
(global-set-key "\C-ces" 'evernote-search-notes)
(global-set-key "\C-ceS" 'evernote-do-saved-search)
(global-set-key "\C-cew" 'evernote-write-note)
(global-set-key "\C-cep" 'evernote-post-region)
(global-set-key "\C-ceb" 'evernote-browser)

;;------------------------------------------------------------------------
;; Markdown
;;------------------------------------------------------------------------
;; downloa
;;(package-install 'markdown-mode)
(require 'markdown-mode)
(setq auto-mode-alist (append '(
        ("\\.md$" . markdown-mode)
        ("\\.text$" . markdown-mode)
        ("\\.markdown$" . markdown-mode)
        )
            auto-mode-alist))

;; Download Markdown.pl v1.0.2b8
;; http://daringfireball.net/projects/downloads/Markdown_1.0.2b8.tbz
;; and Patch Markdown Extra for perl
;; Markdown Extra for perl
;; http://www.sera.desuyo.net/komono/Markdown_1.0.2b8-extra.patch
(setq markdown-command "perl ~/Markdown/Markdown.pl")

;;------------------------------------------------------------------------
;; redo+.el from emacswiki
;;------------------------------------------------------------------------
;;(auto-install-from-emacswiki "redo+")
(require 'redo+ nil t)
(global-set-key (kbd "C-.") 'redo)


;; ------------------------------------------------------------------------
;; @ frame
;; ------------------------------------------------------------------------
;; フレームタイトルの設定
(setq frame-title-format
      (format "%%f - Emacs@%s" (system-name)))

;; ツールバーとスクロールバーを消す
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; jkhlでフレームサイズを切り替え
(defun window-resizer ()
  "Control window size and position."
  (interactive)
  (let ((window-obj (selected-window))
        (current-width (window-width))
        (current-height (window-height))
        (dx (if (= (nth 0 (window-edges)) 0) 1
              -1))
        (dy (if (= (nth 1 (window-edges)) 0) 1
              -1))
        action c)
    (catch 'end-flag
      (while t
        (setq action
              (read-key-sequence-vector (format "size[%dx%d]"
                                                (window-width)
                                                (window-height))))
        (setq c (aref action 0))
        (cond ((= c ?l)
               (enlarge-window-horizontally dx))
              ((= c ?h)
               (shrink-window-horizontally dx))
              ((= c ?j)
               (enlarge-window dy))
              ((= c ?k)
               (shrink-window dy))
              ;; otherwise
              (t
               (let ((last-command-char (aref action 0))
                     (command (key-binding action)))
                 (when command
                   (call-interactively command)))
               (message "Quit")
               (throw 'end-flag t)))))))

;; C-c C-rにwindow-resizerを割り当て
(global-set-key "\C-c\C-r" 'window-resizer)
;; ------------------------------------------------------------------------
;; @ buffer
;; ------------------------------------------------------------------------
;; バッファ画面外文字の切り詰め表示
(setq truncate-lines nil)

;; ウィンドウ縦分割時のバッファ画面外文字の切り詰め表示
(setq truncate-partial-width-windows t)
(defun toggle-truncate-partial-windows ()
  "折り返し表示をトグル動作します."
  (interactive)
  (if truncate-partial-width-windows
      (setq truncate-partial-width-windows nil)
    (setq truncate-partial-width-windows t))
  (recenter))


;; 同一バッファ名にディレクトリ付与
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")

;; ------------------------------------------------------------------------
;; @ fringe
;; ------------------------------------------------------------------------

;; バッファ中の行番号表示
(global-linum-mode t)

;; 行番号のフォーマット
;; (set-face-attribute 'linum nil :foreground "red" :height 0.8)
(set-face-attribute 'linum nil
        :height 0.9
        :foreground "#ccc")
(setq linum-format "%4d")

;; ------------------------------------------------------------------------
;; @ modeline
;; ------------------------------------------------------------------------

;; 行番号の表示
(line-number-mode t)

;; 列番号の表示
(column-number-mode t)

;; 行数の割合表示
(defvar my-lines-page-mode t)
(defvar my-mode-line-format)
(when my-lines-page-mode
  (setq my-mode-line-format "%d")
  (if size-indication-mode
      (setq my-mode-line-format (concat my-mode-line-format " of %%l")))
  (cond ((and (eq line-number-mode t) (eq column-number-mode t))
         (setq my-mode-line-format (concat my-mode-line-format " ((%%l, %%c)")))
        ((eq line-number-mode t)
         (setq my-mode-line-format (concat my-mode-line-format " L%%l")))
        ((eq column-number-mode t)
         (setq my-mode-line-format (concat my-mode-line-format " C%%c")))))

(setq mode-line-position
      '(:eval (format my-mode-line-format
                      (count-lines (point-max) (point-min)))))

;; 時刻の表示
(require 'time)
(setq display-time-24hr-format t)
(setq display-time-string-forms '(24-hours ":" minutes))
(display-time-mode t)

;; ------------------------------------------------------------------------
;; @ cursor

;; カーソル点滅表示
(blink-cursor-mode 0)

;; 現在行のハイライト
(defface my-hl-line-face
  ;; 背景がdarkならば背景色を紺に
  '((((class color) (background dark))
     (:background "NavyBlue" t))
  ;; 背景がlightならば背景色を緑に
    (((class color) (background light))
     (:background "LightGoldenrodYellow" t))
    (t (:bold t)))
  "hl-line's my face")
(setq hl-line-face 'my-hl-line-face)
(global-hl-line-mode t)

;; 現在桁もハイライト
;;(auto-install-batch "crosshairs")
;;(require 'crosshairs)
;;(crosshairs-mode 0)
;;(crosshairs-toggle-when-idle 4)
;;(col-highlight-set-interval 1)

;; スクロール時のカーソル位置の維持
(setq scroll-preserve-screen-position t)

;; スクロール行数（一行ごとのスクロール）
(setq vertical-centering-font-regexp ".*")
(setq scroll-conservatively 35)
(setq scroll-margin 0)
(setq scroll-step 1)

;; 画面スクロール時の重複行数
(setq next-screen-context-lines 1)

;; 最終行に必ず一行挿入
;;(setq require-final-newline t)
;;(setq next-line-add-newlines nil)


;; ------------------------------------------------------------------------
;; @ region

;; 括弧の範囲内を強調表示
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'expression)
(set-face-background 'show-paren-match-face "#500")

;; 選択領域の色
;;   (set-face-background 'region "#555")
;;
;; 行末の空白を強調表示
(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace "#b12770")

;; タブをスペースで扱う
(setq-default indent-tabs-mode nil)
(custom-set-variables '(tab-width 2))

;; ------------------------------------------------------------------------
;; @ default setting

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

;; windows.el
;; (install-elisp "http://www.gentei.org/~yuuji/software/revive.el")
;; (install-elisp "http://www.gentei.org/~yuuji/software/windows.el")
(require 'windows)
(setq win:use-frame nil)
(win:startup-with-window)
(winner-mode 1)
;; 直前のフレーム構成に戻す
(global-unset-key (kbd "M-u"))
(global-set-key (kbd "M-u") 'winner-undo)
;; 次(前)のウィンドウへ
(global-set-key (kbd "C-M-,") 'win-prev-window)
(global-set-key (kbd "C-M-.") 'win-next-window)



;; 画像ファイルを表示
(auto-image-file-mode t)

;; スペルチェック
;;(setq-default flyspell-mode t)
;;(setq ispell-dictionary "american")
;; ------------------------------------------------------------------------
;; @history
;; ------------------------------------------------------------------------
;; 最近使ったファイルをメニューに表示
;;(auto-install-from-emacswiki "recentf-ext.el")
(require 'recentf-ext)
(recentf-mode t)

;; 最近使ったファイルの表示数
(setq recentf-max-menu-items 10)

;; 最近使ったファイルの保存数
(setq recentf-max-saved-items 3000)

;; ミニバッファの履歴を保存する
(savehist-mode 1)

;; ミニバッファの履歴の保存数を増やす
(setq history-length 10000)

;; undohist
;; (auto-install-from-url "http://cx4a.org/pub/undohist.el")
;;(require 'undohist nil t)
;;(undohist-initialize)

;; undo-tree
;;(package-install 'undo-tree)
(require 'undo-tree)
(global-undo-tree-mode)

;; ファイルを自動保存
;;(auto-install-from-url "http://homepage3.nifty.com/oatu/emacs/archives/auto-save-buffers.el")
;;(require 'auto-save-buffers)
;;(run-with-idle-timer 2 t 'auto-save-buffers)

;; 編集中ファイルのバックアップ先 ~/.emacs.d/backups/
(setq auto-save-file-name-transforms
      `((".*" ,"~/.emacs.d/backups/" t)))

;; 編集中ファイルのバックアップ間隔（秒）
(setq auto-save-timeout 15)

;; 編集中ファイルのバックアップ間隔（打鍵）
(setq auto-save-interval 60)

;; バックアップファイルの作成場所 ~/.emacs.d/backups/
(add-to-list 'backup-directory-alist
      (cons "." "~/.emacs.d/backups/"))


;; バックアップ世代数
(setq kept-old-versions 1)
(setq kept-new-versions 2)

;; 古いバックアップファイルの削除
(setq delete-old-versions t)

;; find-file-at-point
;; (ffap-bindings)

;; ------------------------------------------------------------------------
;; @ dired

(require 'dired-x)

;;; diredから"r"でファイル名をインライン編集する
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;; ------------------------------------------------------------------------
;; @ key bind
;(setq indent-line-function 'indent-relative-maybe)
(global-set-key "\C-m" 'newline-and-indent)
(global-set-key "\C-m" 'indent-new-comment-line)

;; C-zでスクロールダウン
;;(global-set-key "\C-z"          'scroll-down)

;; C-c lで折り返しon/off
;; (global-set-key (kbd "C-c l") 'toggle-truncate-lines)
(global-set-key (kbd "C-c l") 'toggle-truncate-partial-windows)


;; C-tでウィンドウ切り替え
(global-set-key (kbd "C-t") 'other-window)
(define-key dired-mode-map "\C-t" 'other-window)

;; M-gでgoto-line
(global-set-key (kbd "M-g") 'goto-line)

;; C-hでbackspace
;;(keyboard-translate ?\C-h ?\C-?)
(global-set-key "\C-h" 'delete-backward-char)

;; C-tabでindent-region
(global-set-key [C-tab] 'indent-region)

;; smartrep
(require 'smartrep)


;; ------------------------------------------------------------------------
;; @ auto-complete.el
;; ------------------------------------------------------------------------
(require 'auto-complete-config nil t)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(define-key ac-mode-map (kbd "S-TAB") 'auto-complete)
(setq ac-ignore-case t)
(ac-config-default)


;; ------------------------------------------------------------------------
;; @ cmigemo
;; ------------------------------------------------------------------------

;; (require 'migemo)
;; (setq migemo-command "cmigemo")

;; (setq migemo-options '("-q" "--emacs"))
;; ;; ;; migemo-dictのパス
;; (setq migemo-dictionary "~/.emacs.d/elisp/migemo/dict/utf-8/migemo-dict")
;; ;; ;;(setq migemo-dictionary "~/.emacs.d/elisp/migemo/dict/cp932/migemo-dict")
;; ;; (setq migemo-dictionary "~/.emacs.d/elisp/migemo/dict/euc-jp/migemo-dict")
;; (setq migemo-user-dictionary nil)
;; (setq migemo-regex-dictionary nil)

;; ;; ;;キャッシュ機能を利用
;; (setq migemo-use-pattern-alist t)
;; (setq migemo-use-frequent-pattern-alist t)
;; (setq migemo-pattern-alist-length 1024)
;; ;; ;; 辞書の文字コードを指定
;; (setq migemo-coding-system 'utf-8)
;; (load-library "migemo")
;; (migemo-init)

;; 日本語整形
;;(require 'text-adjust)

;; ------------------------------------------------------------------------
;; @ anything.el
;; ------------------------------------------------------------------------
(require 'anything-startup)
;;(setq anything-idle-delay 0.1)
;;(setq anything-input-idle-delay 0.1)
;;(setq anything-candidate-number-limit 50)
(setq anything-quick-update t)
(setq anything-enable-shortcuts 'alphabet)
(define-key global-map (kbd "M-y") 'anything-show-kill-ring)
(global-set-key (kbd "C-:") 'anything-for-files)
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


;; color-moccur.el
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
(require 'moccur-edit nil t)
;; moccur-edit後にファイルを保存
(defadvice moccur-edit-change-file
   (after save-after-moccur-edit-buffer activate)
   (save-buffer))

;; anything-c-moccur.el
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

;; ;; anything-rurima.el
;; (require 'anything-rurima)
;; (setq anything-rurima-index-file "~/compile/rurima/rubydoc/rurima.e")


;; wgrep
(require 'wgrep nil t)

;; ------------------------------------------------------------------------
;; YAML
;; ------------------------------------------------------------------------
(when (require 'yaml-mode nil t)
  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode)))


;; ------------------------------------------------------------------------
;; eshellの設定
;; ------------------------------------------------------------------------;
(require 'esh-myparser)
(require 'eshell-pop)
(require 'esh-cmdline-stack)
(global-set-key (kbd "C-x C-z") 'shell-pop)
;; eshellのコマンドを殺す
(progn
 (defmacro eval-after-load* (name &rest body)
   (declare (indent 1))
   `(eval-after-load ,name '(progn ,@body)))
 (defun eshell-disable-unix-command-emulation ()
   (eval-after-load* "em-ls"
     (fmakunbound 'eshell/ls))
   (eval-after-load* "em-unix"
     (mapc 'fmakunbound '(eshell/agrep
                          eshell/basename
                          eshell/cat
                          eshell/cp
                          eshell/date
                          eshell/diff
                          eshell/dirname
                          eshell/du
                          eshell/egrep
                          eshell/fgrep
                          eshell/glimpse
                          eshell/grep
                          eshell/info
                          eshell/ln
                          eshell/locate
                          eshell/make
                          eshell/man
                          eshell/mkdir
                          eshell/mv
                          eshell/occur
                          eshell/rm
                          eshell/rmdir
                          eshell/su
                          eshell/sudo
                          eshell/time))))
 (eshell-disable-unix-command-emulation))

;; defun-eshell-cmdlineの定義
;; via るびきち
(progn
 (defun eshell-in-command-line-p ()
   (<= eshell-last-output-end (point)))
 (defmacro defun-eshell-cmdline (key &rest body)
   (let ((cmd (intern (format "eshell-cmdline/%s" key))))
     `(progn
        (add-hook 'eshell-mode-hook
                  (lambda () (define-key eshell-mode-map (read-kbd-macro ,key) ',cmd)))
        (defun ,cmd ()
          (interactive)
          (if (not (eshell-in-command-line-p))
              (call-interactively (lookup-key (current-global-map) (read-kbd-macro ,key)))
            ,@body)))))
 (defun eshell-history-and-bol (func)
   (delete-region eshell-last-output-end (point-max))
   (funcall func 1)
   (goto-char eshell-last-output-end)))

;; C-wで前の単語を削除
(defun-eshell-cmdline "C-w"
 (if (eq (point-max) (point))
     (backward-kill-word 1)
   (kill-region (region-beginning) (region-end))))

;; C-p で前のコマンド
(defun-eshell-cmdline "C-p"
 (let ((last-command 'eshell-previous-matching-input-from-input))
   (eshell-history-and-bol 'eshell-previous-matching-input-from-input)))

;; C-n で次のコマンド
(defun-eshell-cmdline "C-n"
 (let ((last-command 'eshell-previous-matching-input-from-input))
   (eshell-history-and-bol 'eshell-next-input)))
(defadvice eshell-send-input (after history-position activate)
 (setq eshell-history-index -1))

;; C-c C-z でeshellを新たに起動
(progn
 (defun eshell-new ()
   (interactive)
   (eshell t))
 (defun eshell-mode-hook0 ()
   (define-key eshell-mode-map "\C-c\C-z" 'eshell-new))
 (add-hook 'eshell-mode-hook 'eshell-mode-hook0))
;;------------------------------------------------------------
;; view-mode
;;------------------------------------------------------------
(progn
 (setq pager-keybind
       `( ;; vi-like
         ("h" . backward-char)
         ("l" . forward-char)
         ("j" . next-line)
         ("k" . previous-line)
         ("b" . scroll-down)
         (" " . scroll-up)
         ("w" . forward-word)
         ("e" . backward-word)
         ("J" . ,(lambda () (interactive) (scroll-up 1)))
         ("K" . ,(lambda () (interactive) (scroll-down 1)))
         ))
 (defun define-many-keys (keymap key-table &optional includes)
   (let (key cmd)
     (dolist (key-cmd key-table)
       (setq key (car key-cmd)
             cmd (cdr key-cmd))
       (if (or (not includes) (member key includes))
         (define-key keymap key cmd))))
   keymap)
 (defun view-mode-hook--pager ()
   (define-many-keys view-mode-map pager-keybind))
 (add-hook 'view-mode-hook 'view-mode-hook--pager)
 (global-set-key [f11] 'view-mode)
)
(progn
 (require 'viewer)
 (viewer-stay-in-setup)
 (setq viewer-modeline-color-unwritable "tomato"
       viewer-modeline-color-view "orange")
 (viewer-change-modeline-color-setup))
;; ------------------------------------------------------------------------
;; ホームディレクトリに移動
(cd "~")

;;sequential command
;;(auto-install-batch "sequential-command")
(require 'sequential-command-config)
(sequential-command-setup-keys)

;; zencoding-mode.el
;;(auto-install-from-url "https://raw.github.com/rooney/zencoding/master/zencoding-mode.el")
(require 'zencoding-mode)
(add-hook 'rhtml-mode-hook 'zencoding-mode)
(add-hook 'html-mode-hook 'zencoding-mode)
(define-key zencoding-mode-keymap (kbd "C-j") 'reindent-then-newline-and-indent)
(define-key zencoding-mode-keymap (kbd "C-c C-m") 'zencoding-expand-line)
(define-key zencoding-preview-keymap (kbd "C-c C-m") 'zencoding-preview-accept)
(setq zencoding-inline-tags
      (append
       '("th" "td" )
       zencoding-inline-tags))


;; magitの設定
(require 'magit)
(if (eq system-type 'windows-nt)
    (setq magit-git-executable "C:/Program Files/Git/bin/git.exe"))
;; vc-dirコマンドにmagit-statusを上書き
 (global-set-key (kbd "C-x v d") 'magit-status)


;; ;; ↓こいつをnon-nilにしておくと、vcsによる変更もチェックしてくれる
;; (setq auto-revert-check-vc-info nil)

;; ;; こちらは変更する必要ないけど、早いほうがいいので1とかしてみた
;; (setq auto-revert-interval 10)

(add-hook 'find-file-hook
          '(lambda ()
             (when
                 (and buffer-file-name
                      (vc-backend buffer-file-name))
               (auto-revert-mode))))

;; (defun my-show-git-current-branch ()
;;   (interactive)
;;   (message (magit-get-current-branch))
;;   (my-set-git-current-branch))
;; (define-key esc-map "B" 'my-show-git-current-branch)
;; (defun my-set-git-current-branch ()
;;   (setq mode-line-frame-identification (format "(%s)" (magit-get-current-branch))))
;; (set-default 'mode-line-frame-identification '(my-set-git-current-branch))

;; (add-hook 'magit-post-command-hook 'my-set-git-current-branch)
;; (add-hook 'dired-mode-hook 'my-set-git-current-branch)
;; (add-hook 'find-file-hook  'my-set-git-current-branch)

;; regexp
;; (auto-install-from-url "https://raw.github.com/k-talo/foreign-regexp.el/master/foreign-regexp.el")
(require 'foreign-regexp)
(custom-set-variables
 ;; 正規表現、perlかrubyを選択
 '(foreign-regexp/regexp-type 'ruby) ;; Choose by your preference.
 '(reb-re-syntax 'foreign-regexp)) ;; Tell re-builder to use foreign regexp.

