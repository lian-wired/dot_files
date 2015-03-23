;; Evernote-Emacs-Mode
;; 仕様変更でたぶん使えない 2013-01-28
;;;; (package-install 'evernote-mode)
(require 'evernote-mode)
(setq evernote-username "lian_li") ; optional: you can use this username as default.
(setq evernote-enml-formatter-command '("-dump" "-I" "UTF8" "-O" "UTF8")) ; optional
(global-set-key "\C-cec" 'evernote-create-note)
(global-set-key "\C-ceo" 'evernote-open-note)
(global-set-key "\C-ces" 'evernote-search-notes)
(global-set-key "\C-ceS" 'evernote-do-saved-search)
(global-set-key "\C-cew" 'evernote-write-note)
(global-set-key "\C-cep" 'evernote-post-region)
(global-set-key "\C-ceb" 'evernote-browser)
