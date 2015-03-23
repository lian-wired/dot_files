;; zencoding-mode.el
;; (package-install 'zencoding-mode)
(require 'zencoding-mode)
(add-hook 'web-mode-hook 'zencoding-mode)
(add-hook 'html-mode-hook 'zencoding-mode)
(define-key zencoding-mode-keymap (kbd "C-j") 'reindent-then-newline-and-indent)
(define-key zencoding-mode-keymap (kbd "C-c C-m") 'zencoding-expand-line)
(define-key zencoding-preview-keymap (kbd "C-c C-m") 'zencoding-preview-accept)
(setq zencoding-inline-tags
      (append
       '("th" "td" )
       zencoding-inline-tags))

(setq zencoding-indentation 2)

