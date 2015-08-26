(require 'powerline)

; show the column number in the status bar
(column-number-mode t)

(setq-default
 mode-line-format
 '("%e"
   (:eval
    (let* ((active (powerline-selected-window-active))
	   (mode-line (if active 'mode-line-inactive 'mode-line-inactive))
	   (face1 (if active 'powerline-active1 'powerline-inactive1))
	   (face2 (if active 'powerline-active2 'powerline-inactive2))
	   (separator-left (intern (format "powerline-%s-%s"
					   powerline-default-separator
					   (car powerline-default-separator-dir))))
	   (separator-right (intern (format "powerline-%s-%s"
					    powerline-default-separator
					    (cdr powerline-default-separator-dir))))
	   (lhs (list (powerline-buffer-id `(mode-line-buffer-id ,mode-line) 'l)
		      (when (and vc-mode buffer-file-name)
			(let ((backend (vc-backend buffer-file-name)))
			  ))))
	   (rhs (list (powerline-raw global-mode-string mode-line 'r)
		      (powerline-raw "%l,%c  " mode-line 'l)
		      (powerline-raw (replace-regexp-in-string  "%" "%%" (format-mode-line '(-3 "%p"))) mode-line 'r))))
      (concat (powerline-render lhs)
	      (powerline-fill mode-line (powerline-width rhs))
	      (powerline-render rhs))))))


(provide 'status-line-prt)
