;; auto-complete.el
;; (package-install 'auto-complete)
(require 'auto-complete-config nil t)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-1.4/dict")
(define-key ac-mode-map (kbd "S-TAB") 'auto-complete)
(setq ac-ignore-case t)
(ac-config-default)
