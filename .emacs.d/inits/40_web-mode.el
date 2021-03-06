;; web-mode
;; (auto-install-from-url "https://raw.github.com/fxbois/web-mode/master/web-mode.el")
(require 'web-mode)
(when (< emacs-major-version 24)
  (defalias 'prog-mode 'fundamental-mode))
(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset    2)
  (setq web-mode-code-indent-offset   2)
  (setq web-mode-sql-indent-offset    2)
  (setq web-mode-block-padding        2)
  (setq web-mode-script-padding       0))
(add-hook 'web-mode-hook 'web-mode-hook)
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erubis\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.haml\\'" . haml-mode))

;; 色文字列に色をつける
(setq rainbow-html-colors t)
(setq rainbow-x-colors t)
(setq rainbow-latex-colors t)
(setq rainbow-ansi-colors t)
(add-hook 'css-mode-hook 'rainbow-mode)
(add-hook 'scss-mode-hook 'rainbow-mode)
(add-hook 'html-mode-hook 'rainbow-mode)

(setq web-mode-engine-file-regexps
  '(("angular"          . "\\.component.html\\'")
    ("asp"              . "\\.asp\\'")
    ("aspx"             . "\\.as[cp]x\\'")
    ("archibus"         . "\\.axvw\\'")
    ("blade"            . "\\.blade\\.php\\'")
    ("cl-emb"           . "\\.clemb\\'")
    ("clip"             . "\\.ctml\\'")
    ("closure"          . "\\.soy\\'")
    ("ctemplate"        . "\\.\\(chtml\\|mustache\\)\\'")
    ("django"           . "\\.\\(djhtml\\|tmpl\\|dtl\\|liquid\\|j2\\|njk\\)\\'")
    ("dust"             . "\\.dust\\'")
    ("elixir"           . "\\.eex\\'")
    ("ejs"              . "\\.ejs\\'")
    ("erb"              . "\\.\\(erb\\|rhtml\\|erb\\.html\\|erubis\\)\\'")
    ("freemarker"       . "\\.ftl\\'")
    ("go"               . "\\.go\\(html\\|tmpl\\)\\'")
    ("handlebars"       . "\\.\\(hb\\.html\\|hbs\\)\\'")
    ("hero"             . "\\.hero\\'")
    ("jinja"            . "\\.jinja\\'")
    ("jsp"              . "\\.[gj]sp\\'")
    ("lsp"              . "\\.lsp\\'")
    ("mako"             . "\\.mako?\\'")
    ("marko"            . "\\.marko\\'")
    ("mason"            . "\\.mas\\'")
    ("mojolicious"      . "\\.epl?\\'")
    ("php"              . "\\.\\(p[hs]p\\|ctp\\|inc\\)\\'")
    ("python"           . "\\.pml\\'")
    ("razor"            . "\\.\\(cs\\|vb\\)html\\|\\.razor\\'")
    ("riot"             . "\\.tag\\'")
    ("smarty"           . "\\.tpl\\'")
    ("spip"             . "spip")
    ("template-toolkit" . "\\.tt.?\\'")
    ("thymeleaf"        . "\\.thtml\\'")
    ("velocity"         . "\\.v\\(sl\\|tl\\|m\\)\\'")
    ("xoops"            . "\\.xoops'")

    ("django"           . "[st]wig")
    ("razor"            . "scala")

    )
)

(setq web-mode-auto-close-style nil)
