;; key bind

;(setq indent-line-function 'indent-relative-maybe)
(global-set-key (kbd "C-m") 'newline-and-indent)
(global-set-key (kbd "C-m") 'indent-new-comment-line)

;; C-c lで折り返しon/off
;;(global-set-key (kbd "C-c l") 'toggle-truncate-lines)

;; C-tでウィンドウ切り替え
(global-set-key (kbd "C-t") 'other-window)

;; M-gでgoto-line
(global-set-key (kbd "M-g") 'goto-line)

;; C-hでbackspace
(global-set-key (kbd "C-h") 'delete-backward-char)

;; C-tabでindent-region
(global-set-key [C-tab] 'indent-region)

;;C-zでスクロールダウン
(global-set-key (kbd "C-z") 'scroll-down)

;; find-functionをキー割り当てする
(find-function-setup-keys)


