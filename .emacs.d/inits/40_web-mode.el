;; web-mode
;; (auto-install-from-url "https://raw.github.com/fxbois/web-mode/master/web-mode.el")
(require 'web-mode)
(when (< emacs-major-version 24)
  (defalias 'prog-mode 'fundamental-mode))
(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-html-offset   2)
  (setq web-mode-css-offset    2)
  (setq web-mode-script-offset 2)
  (setq web-mode-php-offset    2)
  (setq web-mode-java-offset   2)
  (setq web-mode-asp-offset    2))
(add-hook 'web-mode-hook 'web-mode-hook)
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erubis\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.haml\\'" . haml-mode))

;; 色文字列に色をつける
(setq rainbow-html-colors t)
(setq rainbow-x-colors t)
(setq rainbow-latex-colors t)
(setq rainbow-ansi-colors t)
(add-hook 'css-mode-hook 'rainbow-mode)
(add-hook 'scss-mode-hook 'rainbow-mode)
(add-hook 'html-mode-hook 'rainbow-mode)


