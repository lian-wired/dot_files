
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq load-path (cons "~/.emacs.d/elisp" load-path))
(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (deeper-blue)))
 '(custom-safe-themes
   (quote
    ("283c87234b7df63a8b0ec7653a1693439e9f8e6942bd32c8b277ed66b06af074" default)))
 '(package-selected-packages
   (quote
    (which-key anything visual-regexp-steroids visual-regexp yasnippet flycheck flycheck-css-colorguard flycheck-julia crosshairs auto-install revive real-auto-save package-utils init-loader zencoding-mode yaml-mode viewer undo-tree smartrep slime-repl sass-mode ruby-electric ruby-block rhtml-mode redo+ paredit org migemo markdown-mode magit inf-ruby git-commit-mode flymake-sass flymake-ruby flymake-jslint flymake-haml flymake-css flymake feature-mode evernote-mode csv-mode color-theme coffee-mode auto-complete)))
 '(tab-width 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
