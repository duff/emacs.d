(projectile-global-mode)
(persp-mode)

(setq projectile-enable-caching t)             ;; Cache the things

;; Regnerate tags when idle - defaults to 30 seconds
(setq projectile-enable-idle-timer t)

(setq projectile-sort-order (quote recentf))

(setq projectile-project-root-files
      (quote ("Gemfile" "package.json" "gulpfile.js" "Gruntfile.js" "mix.exs" "README.md")))


;; Only show the current perspective in the modeline, not all of them.
(defun persp-update-modestring ()
  (when persp-show-modestring
    (setq persp-modestring
           (concat "[" (persp-name persp-curr) "]"))))


(provide 'project-prt)
