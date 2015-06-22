;; No backup files.  No menubar.  No toolbar.
(set-background-color "black")

(setq make-backup-files nil)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq inhibit-startup-screen t)
(setq ns-use-native-fullscreen nil)

(setq ruby-insert-encoding-magic-comment nil)  ;; No magic #coding utf-8 line

(add-to-list 'default-frame-alist '(height . 49))
(add-to-list 'default-frame-alist '(width . 178))


;; Save histories
(setq savehist-additional-variables '(search-ring regexp-search-ring))
(savehist-mode 1)

;; Make ctrl-u work correctly
(setq evil-want-C-u-scroll t)

(require 'evil)
(evil-mode 1)

(global-evil-visualstar-mode 1)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-jumper-mode)
(add-hook 'projectile-mode-hook 'projectile-rails-on)
(projectile-global-mode)

(setq projectile-sort-order (quote recently-active))            ;; Show projectile lists by most recently active
(setq projectile-enable-caching t)
(setq projectile-project-root-files
      (quote ("Gemfile" "package.json" "gulpfile.js" "Gruntfile.js" "mix.exs" "README.md")))

(require 'evil-surround)
(global-evil-surround-mode 1)

(require 'key-chord)
(key-chord-mode 1)

(defun add-enter ()
  (interactive)
  (evil-beginning-of-visual-line)
  (newline)
  (back-to-indentation))


(global-company-mode t)

(setq company-idle-delay nil)           ;; Don't automatically show auto complete
(setq company-tooltip-limit 12)         ;; Make it a longer list
(setq company-selection-wrap-around t)  ;; Get back to the top

(setq ring-bell-function 'ignore)       ;; Quiet please

(require 'evil-matchit)
(global-evil-matchit-mode 1)

(require 'evil-args)
(setq evil-args-delimiters (quote (",")))

(setq scroll-margin 5
scroll-conservatively 9999
scroll-step 1)

(require 'elixir-mode)
(require 'ruby-mode)

(modify-syntax-entry (string-to-char "_") "w" ruby-mode-syntax-table)
(modify-syntax-entry (string-to-char "_") "w" elixir-mode-syntax-table)

;; Remove noise from neotree
(setq neo-show-updir-line nil)
(setq neo-banner-message nil)
(setq neo-theme 'arrow)
(setq neo-mode-line-type 'none)
(setq neo-window-width 30)

; Remember the cursor position of files when reopening them
(setq-default save-place t)
(require 'saveplace)

(set-frame-font "Inconsolata-dz 11")

;; Fix up parens
(show-paren-mode t)
(setq show-paren-delay 0)
(smartparens-global-mode t)

;; Don't higlight the paren / quote area
(setq sp-highlight-pair-overlay nil)
(setq sp-highlight-wrap-overlay nil)
(setq sp-highlight-wrap-tag-overlay nil)

(setq-default show-trailing-whitespace t)      ;; Highlight trailing whitespace
(setq make-backup-files nil)                   ;; No backup files please

(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)

(setq ido-decorations (quote ("\n↪ "     "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))

(evil-commentary-mode)
(global-linum-mode t)                     ; Show line numbers
(setq-default truncate-lines t)           ; Don't word wrap
(column-number-mode t)                    ; show the column number in the status bar
(blink-cursor-mode 0)                     ; Turn off cursor blinking


(set-face-background 'linum "#1c1c1c")
(set-face-foreground 'linum "#787C81")
(set-face-background 'fringe "Black")

(defun buffer-exists (bufname)   (not (eq nil (get-buffer bufname))))
(defun toggle-to-previous-buffer ()
  (interactive)
  (if (buffer-exists "*Ibuffer*")  (kill-buffer "*Ibuffer*"))
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(defun uno-email-mode ()
  (interactive)
  (find-file "~/tmp/email.txt")
  (mail-mode)
  (visual-line-mode)
  (linum-mode -1)
  (writeroom-mode t)
  )

(defun minibuffer-keyboard-quit ()
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))


(require 'ag)

(setq ag-reuse-window 't)

(defun ag-regexp-project-sans-point (regexp)
  (interactive (list (read-from-minibuffer "Search regexp: ")))
  (ag/search regexp (ag/project-root default-directory) :regexp t))

;; Save all files when focus is lost
(defun save-all ()
  (interactive)
  (save-some-buffers t))

(add-hook 'focus-out-hook 'save-all)

(provide 'anything-prt)
