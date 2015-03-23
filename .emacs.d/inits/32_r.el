(setq auto-mode-alist
      (append '(
                ("\\.r$" . R-mode)
                ("\\.R$" . 'R-mode))
              auto-mode-alist))
(autoload 'R-mode "ess-site" "Emacs Speaks Statistics mode" t)
