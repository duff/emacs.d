
(setq ring-bell-function 'ignore)         ;; Quiet please
(setq make-backup-files nil)              ;; No backup files please
(setq-default save-place t)               ;; Remember the cursor positions
(global-auto-revert-mode t)               ;; Revert buffers automatically when underlying files are changed
(setq-default indent-tabs-mode nil)       ;; Prevent extraneous tabs
(setq auto-save-default nil)              ;; Don't auto save
(setq tags-case-fold-search nil)          ;; Make tags case sensitive
(setq dabbrev-case-fold-search nil)       ;; Make auto complete case sensitive
(setq dabbrev-check-other-buffers nil)    ;; Only look in current buffer for auto complete
(setq large-file-warning-threshold nil)   ;; Stop bothering me about large files.  Just open them.
(setq tags-revert-without-query 1)        ;; Automatically reload the tags file
(setq neo-create-file-auto-open t)        ;; Auto open new file

;; Save histories
(setq savehist-additional-variables '(search-ring regexp-search-ring))
(savehist-mode 1)

(setq-default ispell-program-name "/usr/local/bin/aspell")   ;; Ensure flyspell doesn't get confused
(setq etags-select-no-select-for-one-match t)                ;; Don't confirm if only one match

(modify-syntax-entry (string-to-char "_") "w" ruby-mode-syntax-table)
(modify-syntax-entry (string-to-char "_") "w" elixir-mode-syntax-table)

(setq ag-reuse-window 't)

(setq projectile-switch-project-action 'neotree-projectile-switcheroo)

(setq ruby-insert-encoding-magic-comment nil)  ;; No magic #coding utf-8 line

(add-hook 'focus-out-hook (lambda() (interactive)(save-some-buffers "t")))

(defalias 'yes-or-no-p 'y-or-n-p)

(smex-initialize)

;; Allow this Emacs process to be a server for client processes.
(server-start)


(provide 'misc-prt)
