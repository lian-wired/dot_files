(require 'visual-regexp)
(require 'visual-regexp-steroids)
(setq vr/engine 'python)
(global-set-key (kbd "M-%") 'vr/query-replace)
