;;dired

(require 'dired-x)
;; ;;; diredから"r"でファイル名をインライン編集する
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;; diredでもC-tでウィンドウ切り替え
(define-key dired-mode-map "\C-t" 'other-window)
