;; ;; ------------------------------------------------------------------------
;; ;; eshellの設定
;; ;; ------------------------------------------------------------------------;
;; (require 'esh-myparser)
;; (require 'eshell-pop)
;; (require 'esh-cmdline-stack)
;; (global-set-key (kbd "C-x C-z") 'shell-pop)
;; ;; eshellのコマンドを殺す
;; (progn
;;  (defmacro eval-after-load* (name &rest body)
;;    (declare (indent 1))
;;    `(eval-after-load ,name '(progn ,@body)))
;;  (defun eshell-disable-unix-command-emulation ()
;;    (eval-after-load* "em-ls"
;;      (fmakunbound 'eshell/ls))
;;    (eval-after-load* "em-unix"
;;      (mapc 'fmakunbound '(eshell/agrep
;;                           eshell/basename
;;                           eshell/cat
;;                           eshell/cp
;;                           eshell/date
;;                           eshell/diff
;;                           eshell/dirname
;;                           eshell/du
;;                           eshell/egrep
;;                           eshell/fgrep
;;                           eshell/glimpse
;;                           eshell/grep
;;                           eshell/info
;;                           eshell/ln
;;                           eshell/locate
;;                           eshell/make
;;                           eshell/man
;;                           eshell/mkdir
;;                           eshell/mv
;;                           eshell/occur
;;                           eshell/rm
;;                           eshell/rmdir
;;                           eshell/su
;;                           eshell/sudo
;;                           eshell/time))))
;;  (eshell-disable-unix-command-emulation))

;; ;; defun-eshell-cmdlineの定義
;; ;; via るびきち
;; (progn
;;  (defun eshell-in-command-line-p ()
;;    (<= eshell-last-output-end (point)))
;;  (defmacro defun-eshell-cmdline (key &rest body)
;;    (let ((cmd (intern (format "eshell-cmdline/%s" key))))
;;      `(progn
;;         (add-hook 'eshell-mode-hook
;;                   (lambda () (define-key eshell-mode-map (read-kbd-macro ,key) ',cmd)))
;;         (defun ,cmd ()
;;           (interactive)
;;           (if (not (eshell-in-command-line-p))
;;               (call-interactively (lookup-key (current-global-map) (read-kbd-macro ,key)))
;;             ,@body)))))
;;  (defun eshell-history-and-bol (func)
;;    (delete-region eshell-last-output-end (point-max))
;;    (funcall func 1)
;;    (goto-char eshell-last-output-end)))

;; ;; C-wで前の単語を削除
;; (defun-eshell-cmdline "C-w"
;;  (if (eq (point-max) (point))
;;      (backward-kill-word 1)
;;    (kill-region (region-beginning) (region-end))))

;; ;; C-p で前のコマンド
;; (defun-eshell-cmdline "C-p"
;;  (let ((last-command 'eshell-previous-matching-input-from-input))
;;    (eshell-history-and-bol 'eshell-previous-matching-input-from-input)))

;; ;; C-n で次のコマンド
;; (defun-eshell-cmdline "C-n"
;;  (let ((last-command 'eshell-previous-matching-input-from-input))
;;    (eshell-history-and-bol 'eshell-next-input)))
;; (defadvice eshell-send-input (after history-position activate)
;;  (setq eshell-history-index -1))

;; ;; C-c C-z でeshellを新たに起動
;; (progn
;;  (defun eshell-new ()
;;    (interactive)
;;    (eshell t))
;;  (defun eshell-mode-hook0 ()
;;    (define-key eshell-mode-map "\C-c\C-z" 'eshell-new))
;;  (add-hook 'eshell-mode-hook 'eshell-mode-hook0))
