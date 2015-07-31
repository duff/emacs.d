
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
  (find-file "~/code/scratch/email.txt")
  (mail-mode)
  (visual-line-mode t)
  (linum-mode -1)
  (setq writeroom-width 70)
  (writeroom-mode t)
  (flyspell-mode t)
  (flyspell-buffer))

(defun uno-email-mode-off ()
  (interactive)
  (mail-mode)
  (visual-line-mode -1)
  (visual-line-mode -1)
  (linum-mode t)
  (writeroom-mode -1)
  (flyspell-mode -1))


(defun prose-mode-on ()
  (interactive)
  (markdown-mode)
  (linum-mode -1)
  (writeroom-mode t)
  (visual-line-mode t)
  (flyspell-mode t)
  (flyspell-buffer))

(defun prose-mode-off ()
  (interactive)
  (linum-mode t)
  (writeroom-mode -1)
  (visual-line-mode -1)
  (flyspell-mode -1))


(defun neotree-show-then-find ()
  "Opening it first helps to keep the directory where it is."
  (interactive)
  (neo-global--open)
  (neotree-find)
  )

(defun projectile-find-file-in (&optional prefix)
  (interactive)
  (let ((file (projectile-completing-read "Find file: "
                                          (projectile-current-project-files)
                                          prefix)))
    (find-file (expand-file-name file (projectile-project-root)))
    (run-hooks 'projectile-find-file-hook)))


(defun split-window-below-and-focus ()
  "Split the window vertically and focus the new window."
  (interactive)
  (split-window-below)
  (windmove-down)
  )

(defun split-window-right-and-focus ()
  "Split the window horizontally and focus the new window."
  (interactive)
  (split-window-right)
  (windmove-right)
  )

(fset 'reply-to-email-in-clipboard
   [?v ?a ?e ?p ?g ?g ?\C-v ?G ?I ?> ?  escape ?v ?a ?e ?g ?q ?, ?h ?g ?g])

(provide 'utility-functions-prt)
