
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
 '(ag-highlight-search t)
 '(ag-reuse-buffers (quote nil))
 '(ag-reuse-window (quote nil))
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(magit-dispatch-arguments nil)
 '(package-selected-packages
   (quote
    (typescript-mode ess wgrep-ag wgrep scss-mode enh-ruby-mode multiple-cursors js2-mode which-key anything visual-regexp-steroids visual-regexp yasnippet flycheck flycheck-css-colorguard flycheck-julia crosshairs auto-install revive real-auto-save package-utils init-loader zencoding-mode yaml-mode viewer undo-tree smartrep slime-repl sass-mode ruby-electric ruby-block rhtml-mode redo+ paredit org migemo markdown-mode magit inf-ruby git-commit-mode flymake-sass flymake-ruby flymake-jslint flymake-haml flymake-css flymake feature-mode evernote-mode csv-mode color-theme coffee-mode auto-complete)))
 '(ruby-insert-encoding-magic-comment nil)
 '(tab-width 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
