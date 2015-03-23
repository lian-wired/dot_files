(when (require 'yaml-mode nil t)
  (setq auto-mode-alist (append '(
                  ("\\.yaml$" . yaml-mode)
                  ("\\.yml$" . yaml-mode)
                  )auto-mode-alist)))

