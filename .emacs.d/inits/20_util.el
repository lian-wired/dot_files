;; redo+.el
;;(package-install 'redo+)
(require 'redo+)
(global-set-key (kbd "C-.") 'redo)

;; 同一バッファ名にディレクトリ付与
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")

;; 最終行に必ず一行挿入
(setq require-final-newline t)
(setq next-line-add-newlines nil)


;; スペルチェック
;; (setq-default flyspell-mode t)
;; (setq ispell-dictionary "american")

;; find-file-at-point
;; (ffap-bindings)

;; smartrep
(require 'smartrep)

;; GCを減らす
(setq gc-cons-threshold (* 100 gc-cons-threshold))

;; ログの記録行数を増やす
(setq message-log-max 10000)

;; ;;;試行錯誤用ファイルを開くための設定
(require 'open-junk-file)
(global-set-key (kbd "C-z") 'open-junk-file)

;; クリップボードをkill-ringと同期
(setq x-select-enable-clipboard t)
(global-set-key "\C-y" 'x-clipboard-yank)

;; multi-term
(require 'multi-term)
(setq multi-term-program "/bin/zsh")
(setq term-unbind-key-list '("C-x" "C-c" "<ESC>" "C-t"))
(setq term-bind-key-alist
      '(
        ("C-c C-c" . term-interrupt-subjob)
        ("C-m" . term-send-raw)
        ("M-f" . term-send-forward-word)
        ("M-b" . term-send-backward-word)
        ("M-o" . term-send-backspace)
        ("M-p" . term-send-up)
        ("M-n" . term-send-down)
        ("M-M" . term-send-forward-kill-word)
        ("M-N" . term-send-backward-kill-word)
        ("M-r" . term-send-reverse-search-history)
        ("M-," . term-send-input)
        ("M-." . comint-dynamic-complete)
        ))

;; ;; コード中のブロックを折り畳む
;; ;; (auto-install-from-url "http://www.dur.ac.uk/p.j.heslin/Software/Emacs/Download/fold-dwim.el")
;; (require 'hideshow)
;; (require 'fold-dwim)

;; (require 'ediff)
;; (setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; ;; 日本語整形
;; ;;(require 'text-adjust)

;; ;; wgrep
;; (require 'wgrep nil t)


;; ;;sequential command
;; ;;(auto-install-batch "sequential-command")
;; (require 'sequential-command-config)
;; (sequential-command-setup-keys)




