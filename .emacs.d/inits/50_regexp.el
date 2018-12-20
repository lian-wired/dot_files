(require 'visual-regexp)
(require 'visual-regexp-steroids)
(setq vr/engine 'python)
(global-set-key (kbd "C-c r") 'vr/query-replace)
