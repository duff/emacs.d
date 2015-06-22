(global-evil-visualstar-mode 1)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-jumper-mode)

(setq company-idle-delay nil)           ;; Don't automatically show auto complete
(setq company-tooltip-limit 12)         ;; Make it a longer list
(setq company-selection-wrap-around t)  ;; Get back to the top
(setq ring-bell-function 'ignore)       ;; Quiet please
(setq make-backup-files nil)            ;; No backup files please
(setq-default save-place t)             ;; Remember the cursor positions
(setq evil-want-C-u-scroll t)           ;; Make ctrl-u work correctly
(global-auto-revert-mode t)             ;; Revert buffers automatically when underlying files are changed
(setq-default indent-tabs-mode nil)     ;; Prevent extraneous tabs
(defalias 'yes-or-no-p 'y-or-n-p)       ;; Enable y/n answers

;; Save histories
(setq savehist-additional-variables '(search-ring regexp-search-ring))
(savehist-mode 1)

(add-hook 'projectile-mode-hook 'projectile-rails-on)
(projectile-global-mode)
(setq projectile-sort-order (quote recently-active))            ;; Show projectile lists by most recently active
(setq projectile-enable-caching t)
(setq projectile-project-root-files
      (quote ("Gemfile" "package.json" "gulpfile.js" "Gruntfile.js" "mix.exs" "README.md")))


(global-company-mode t)

(setq evil-args-delimiters (quote (",")))

(modify-syntax-entry (string-to-char "_") "w" ruby-mode-syntax-table)
(modify-syntax-entry (string-to-char "_") "w" elixir-mode-syntax-table)

(smartparens-global-mode t)

(evil-commentary-mode)

(setq ag-reuse-window 't)

(setq ruby-insert-encoding-magic-comment nil)  ;; No magic #coding utf-8 line

(add-hook 'focus-out-hook (lambda() (interactive)(save-some-buffers "t")))

(provide 'anything-prt)
