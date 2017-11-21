;; ruby-mode
;; (package-install 'ruby-mode)
(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(setq auto-mode-alist
      (append '(
                ("\\.rb$" . ruby-mode)
                ("\\.rake$" . ruby-mode)
                ("\\.thor$" . ruby-mode)
                ("\\.god$" . ruby-mode)
                ("\\.gemspec$" . ruby-mode)
                ("Gemfile$" . ruby-mode)
                ("Capfile$" . ruby-mode)
                ("Guardfile$" . ruby-mode)
                ("Rakefile$" . ruby-mode)
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
;;(package-install 'ruby-block)
(require 'ruby-block)
(add-hook 'ruby-mode-hook '(lambda () (ruby-block-mode t)))
(setq ruby-block-highlight-toggle t)
(ruby-block-mode t)


