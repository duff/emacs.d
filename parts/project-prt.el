(projectile-global-mode)
(persp-mode)

(add-hook 'projectile-mode-hook 'projectile-rails-on)

(setq projectile-enable-caching t)             ;; Cache the things
(setq projectile-idle-timer-seconds 60)        ;; Regnerate tags when idle
(setq projectile-sort-order (quote recentf))
(setq projectile-switch-project-action 'neotree-projectile-switcheroo-callback)


(setq projectile-project-root-files
      (quote ("Gemfile" "package.json" "gulpfile.js" "Gruntfile.js" "mix.exs" "README.md")))


;; Only show the current perspective in the modeline, not all of them.
(defun persp-update-modestring ()
  (when persp-show-modestring
    (setq persp-modestring
           (concat "[" (persp-name persp-curr) "]"))))




(provide 'project-prt)
