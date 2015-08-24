
(defun neotree-find-with-projectile ()
  (interactive)
  (neotree-projectile-action)
  (switch-to-previous-buffer)
  (neotree-find)
  )

(defun projectile-find-file-in (&optional prefix)
  (interactive)
  (let ((file (projectile-completing-read "Find file: "
                                          (projectile-current-project-files)
                                          prefix)))
    (find-file (expand-file-name file (projectile-project-root)))
    (run-hooks 'projectile-find-file-hook)))


(defun neotree-projectile-switcheroo-callback ()
  "Switch to a new project - update neotree and then do the default"
  (interactive)
  (neotree-projectile-action)
  (projectile-find-file)
  )

(defun toggle-to-previous-perspective ()
  (interactive)
  (neotree-hide)
  (persp-switch (persp-name persp-last))
  )

(defun projectile-find-file-in-test ()
  "Projectile find a file in the test or spec directory"
  (interactive)
  (if (projectile-file-exists-p "spec")
    (projectile-find-file-in "spec/")
  (projectile-find-file-in "test/"))
  )

(defun projectile-find-file-in-view ()
  "Projectile find a file in the views or web/templates directory"
  (interactive)
  (if (projectile-file-exists-p "mix.exs")
    (projectile-find-file-in "web/templates/")
  (projectile-find-file-in "views/"))
  )


(provide 'projectile-functions-prt)
