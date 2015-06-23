
(defun add-enter ()
  (interactive)
  (evil-beginning-of-visual-line)
  (newline)
  (back-to-indentation))

(defun buffer-exists (bufname)   (not (eq nil (get-buffer bufname))))
(defun toggle-to-previous-buffer ()
  (interactive)
  (if (buffer-exists "*Ibuffer*")  (kill-buffer "*Ibuffer*"))
  (switch-to-buffer (other-buffer (current-buffer) 1)))

;; Used to escape all the things
(defun minibuffer-keyboard-quit ()
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))

(defun ag-regexp-project-sans-point (regexp)
  (interactive (list (read-from-minibuffer "Search regexp: ")))
  (ag/search regexp (ag/project-root default-directory) :regexp t))


(defun uno-email-mode ()
  (interactive)
  (find-file "~/tmp/email.txt")
  (mail-mode)
  (visual-line-mode t)
  (linum-mode -1)
  (flyspell-mode t)
  (setq writeroom-width 70)
  (writeroom-mode t)
  )

(defun scratch-ruby-mode ()
  (interactive)
  (find-file "~/tmp/ruby-scratch.rb")
  )

(defun scratch-bash-mode ()
  (interactive)
  (find-file "~/tmp/bash-scratch.sh")
  )

(provide 'utility-functions-prt)
