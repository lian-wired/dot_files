(add-to-list 'auto-mode-alist '("\\.el$" . emacs-lisp-mode))
;; ;;;式の評価結果を注釈するための設定

(require 'lispxmp)
(defun %lispxmp-doit (eval-last-sexp-function)
  (let ((comment-start ";"))
    (comment-kill nil)
    (comment-indent)
    (save-excursion
      (let ((current-prefix-arg t)) (call-interactively eval-last-sexp-function)))
    (insert " => ")))

(defun lispxmp-emacs-lisp ()
  (interactive)
  (%lispxmp-doit 'eval-last-sexp))

(defun lispxmp-slime ()
  (interactive)
  (%lispxmp-doit 'slime-eval-last-expression))

(define-key emacs-lisp-mode-map "\C-c\C-e" 'lispxmp-emacs-lisp)

;; ;; emacs-lisp-modeでC-c C-dを押すと注釈される
(define-key emacs-lisp-mode-map (kbd "C-c C-d") 'lispxmp)

;; ;;;括弧の対応を保持して編集する設定
(require 'paredit)
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-mode-hook 'enable-paredit-mode)
(add-hook 'ielm-mode-hook 'enable-paredit-mode)

;; ;; エコーエリアにEmacs Lispのヘルプを表示
(require 'eldoc)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
(setq eldoc-idle-delay 0.2) ;すぐに表示したい
(setq eldoc-minor-mode-string "") ;モードラインにElDocと表示しない
