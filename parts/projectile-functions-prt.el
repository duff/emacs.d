
(defun toggle-to-previous-perspective ()
  (interactive)
  (neotree-hide)
  (persp-switch (persp-name persp-last))
  )

(defun projectile-find-file-in (&optional prefix)
  (interactive)
  (let ((file (projectile-completing-read "Find file: "
                                          (projectile-current-project-files)
                                          :initial-input prefix)))
    (find-file (expand-file-name file (projectile-project-root)))
    (run-hooks 'projectile-find-file-hook)))

(defun projectile-find-file-in-test ()
  "Projectile find a file in the test or spec directory"
  (interactive)
  (if (projectile-verify-file "spec")
    (projectile-find-file-in "spec/")
  (projectile-find-file-in "test/"))
  )

(defun projectile-find-file-in-view ()
  "Projectile find a file in the views or web/templates directory"
  (interactive)
  (if (projectile-verify-file "mix.exs")
    (projectile-find-file-in "web/templates/")
  (projectile-find-file-in "views/"))
  )


(provide 'projectile-functions-prt)
