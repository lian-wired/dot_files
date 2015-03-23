;; view-mode
(progn
 (setq pager-keybind
       `( ;; vi-like
         ("h" . backward-char)
         ("l" . forward-char)
         ("j" . next-line)
         ("k" . previous-line)
         ("b" . scroll-down)
         (" " . scroll-up)
         ("w" . forward-word)
         ("e" . backward-word)
         ("J" . ,(lambda () (interactive) (scroll-up 1)))
         ("K" . ,(lambda () (interactive) (scroll-down 1)))
         ))
 (defun define-many-keys (keymap key-table &optional includes)
   (let (key cmd)
     (dolist (key-cmd key-table)
       (setq key (car key-cmd)
             cmd (cdr key-cmd))
       (if (or (not includes) (member key includes))
         (define-key keymap key cmd))))
   keymap)
 (defun view-mode-hook--pager ()
   (define-many-keys view-mode-map pager-keybind))
 (add-hook 'view-mode-hook 'view-mode-hook--pager)
 (global-set-key [f11] 'view-mode)
)
(progn
 (require 'viewer)
 (viewer-stay-in-setup)
 (setq viewer-modeline-color-unwritable "tomato"
       viewer-modeline-color-view "orange")
 (viewer-change-modeline-color-setup))
;; ------------------------------------------------------------------------
