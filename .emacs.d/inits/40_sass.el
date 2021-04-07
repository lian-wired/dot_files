;; scss-mode
(require 'sass-mode)
(add-to-list 'auto-mode-alist '("\\.sass\\'" . sass-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . sass-mode))

;; コメントの記法を//にする
(defun my-sass-mode-hook ()
  "コメントの記法を//に"
  (set (make-local-variable 'comment-start) "//"))
(add-hook 'sass-mode-hook 'my-sass-mode-hook)
