;; js2-mode
;; downloaded from github "git://github.com/mooz/js2-mode.git"
(autoload 'js2-mode "js2-mode" nil t)
(setq auto-mode-alist
      (append '(
                ("\\.js$" . js2-mode)
                ("\\.jsx$" . js2-mode)) auto-mode-alist))
(setq js2-indent-on-enter-key t)
(setq js2-enter-indents-newline t)
(setq js2-basic-offset 2)

