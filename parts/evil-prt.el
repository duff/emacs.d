(global-evil-visualstar-mode 1)
(global-evil-leader-mode)
(evil-leader/set-leader ",")

(setq evil-flash-delay 0.4)               ;; Highlight searches for less time

(setq evil-args-delimiters (quote (",")))

(evil-commentary-mode)

;; Stop adjusting clipboard with visual selection
;; Allows one to copy from another app and paste over a visual selection
(defadvice evil-visual-update-x-selection (around clobber-x-select-text activate)
  (fset 'old-x-select-text (symbol-function 'x-select-text))
  (fmakunbound 'x-select-text)
  ad-do-it
  (fset 'x-select-text (symbol-function 'old-x-select-text)))


(provide 'evil-prt)
