;; C-c C-r + j/k/h/lでフレームサイズを切り替え
(defun window-resizer ()
  "Control window size and position."
  (interactive)
  (let ((window-obj (selected-window))
        (current-width (window-width))
        (current-height (window-height))
        (dx (if (= (nth 0 (window-edges)) 0) 1
              -1))
        (dy (if (= (nth 1 (window-edges)) 0) 1
              -1))
        action c)
    (catch 'end-flag
      (while t
        (setq action
              (read-key-sequence-vector (format "size[%dx%d]"
                                                (window-width)
                                                (window-height))))
        (setq c (aref action 0))
        (cond ((= c ?l)
               (enlarge-window-horizontally dx))
              ((= c ?h)
               (shrink-window-horizontally dx))
              ((= c ?j)
               (enlarge-window dy))
              ((= c ?k)
               (shrink-window dy))
              ;; otherwise
              (t
               (let ((last-command-char (aref action 0))
                     (command (key-binding action)))
                 (when command
                   (call-interactively command)))
               (message "Quit")
               (throw 'end-flag t)))))))
(global-set-key "\C-c\C-r" 'window-resizer)

;; windows.el
;; download from "http://www.gentei.org/~yuuji/software/revive.el"
;; download from "http://www.gentei.org/~yuuji/software/windows.el"
(require 'windows)
(setq win:use-frame nil)
(win:startup-with-window)
(winner-mode 1)
;; 直前のフレーム構成に戻す
(global-unset-key (kbd "M-u"))
(global-set-key (kbd "M-u") 'winner-undo)
;; 次(前)のウィンドウへ
(global-set-key (kbd "C-M-,") 'win-prev-window)
(global-set-key (kbd "C-M-.") 'win-next-window)

