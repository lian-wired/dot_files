;; Markdown
;;------------------------------------------------------------------------
;;(package-install 'markdown-mode)
(require 'markdown-mode)
(setq auto-mode-alist (append '(
        ("\\.md$" . markdown-mode)
        ("\\.text$" . markdown-mode)
        ("\\.markdown$" . markdown-mode)
        )
            auto-mode-alist))

;; Download Markdown.pl v1.0.2b8
;; http://daringfireball.net/projects/downloads/Markdown_1.0.2b8.tbz
;; and Patch Markdown Extra for perl
;; Markdown Extra for perl
;; http://www.sera.desuyo.net/komono/Markdown_1.0.2b8-extra.patch
(setq markdown-command "multimarkdown")
