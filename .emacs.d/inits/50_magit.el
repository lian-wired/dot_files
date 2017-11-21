;; magitの設定
(require 'magit)
(if (eq system-type 'windows-nt)
    (setq magit-git-executable "C:/Program Files/Git/bin/git.exe"))
;; vc-dirコマンドにmagit-statusを上書き
 (global-set-key (kbd "C-x v d") 'magit-status)


;; ↓こいつをnon-nilにしておくと、vcsによる変更もチェックしてくれる
(setq auto-revert-check-vc-info t)

;; こちらは変更する必要ないけど、早いほうがいいので1とかしてみた
(setq auto-revert-interval 1)

(add-hook 'find-file-hook
          '(lambda ()
             (when
                 (and buffer-file-name
                      (vc-backend buffer-file-name))
               (auto-revert-mode))))

(defun my-show-git-current-branch ()
  (interactive)
  (message (magit-get-current-branch))
  (my-set-git-current-branch))
(define-key esc-map "B" 'my-show-git-current-branch)
(defun my-set-git-current-branch ()
  (setq mode-line-frame-identification (format "(%s)" (magit-get-current-branch))))
(set-default 'mode-line-frame-identification '(my-set-git-current-branch))

(add-hook 'magit-post-command-hook 'my-set-git-current-branch)
(add-hook 'dired-mode-hook 'my-set-git-current-branch)
(add-hook 'find-file-hook  'my-set-git-current-branch)

