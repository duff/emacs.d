(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(package-initialize)

;; Refresh the package descriptions
(unless package-archive-contents
  (package-refresh-contents))

;; No backup files.  No menubar.  No toolbar.
(setq make-backup-files nil)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq inhibit-startup-screen t)
(setq ns-use-native-fullscreen nil)

(add-to-list 'default-frame-alist '(height . 49))
(add-to-list 'default-frame-alist '(width . 178))

(global-set-key (kbd "<s-return>") 'toggle-frame-fullscreen)
(global-set-key (kbd "C-l")  'windmove-right)
(global-set-key (kbd "C-h")  'windmove-left)
(global-set-key (kbd "C-k")  'windmove-up)
(global-set-key (kbd "C-j")  'windmove-down)

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

(projectile-global-mode)

(setq projectile-sort-order (quote recently-active))            ;; Show projectile lists by most recently active
(setq projectile-enable-caching t)
(setq projectile-project-root-files
      (quote ("Gemfile" "package.json" "gulpfile.js" "Gruntfile.js" "mix.exs" "README.md")))

(require 'evil-surround)
(global-evil-surround-mode 1)

(evil-leader/set-key
  "w" 'save-buffer
  "v" 'split-window-right
  "s" 'split-window-below
  "d" 'neotree-toggle
  "n" 'neotree-find
  "q" 'kill-buffer
  "q" (kbd ":q")
  "x" (kbd ":wq")
  "h" 'delete-trailing-whitespace
  "A" 'ag-regexp-project-at-point
  "a" 'ag-regexp-project-sans-point
  "f" 'projectile-find-file
  "b" 'ido-switch-buffer
  "e" 'uno-email-mode
  "F" (lambda() (interactive)(projectile-find-file "t"))
  "c" (lambda() (interactive)(find-file "~/.emacs.d/init.el"))
  )

(require 'key-chord)
(key-chord-mode 1)

;; Improved escape
(key-chord-define evil-insert-state-map ";;" 'evil-normal-state)
(key-chord-define evil-visual-state-map ";;" 'evil-change-to-previous-state)

(define-key evil-normal-state-map "gl" 'move-end-of-line)
(define-key evil-normal-state-map "gh" 'back-to-indentation)

(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

(require 'evil-matchit)
(global-evil-matchit-mode 1)

(define-key evil-normal-state-map (kbd "SPC") 'evilmi-jump-items)

(setq scroll-margin 5
scroll-conservatively 9999
scroll-step 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-solarized-dark)))
 '(custom-safe-themes
   (quote
    ("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(set-background-color "black")

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


(add-hook 'neotree-mode-hook
 (lambda ()
   (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
   (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
   (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
   (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
   (define-key evil-normal-state-local-map (kbd "ma") 'neotree-create-node)
   (define-key evil-normal-state-local-map (kbd "md") 'neotree-delete-node)
   (define-key evil-normal-state-local-map (kbd "r") 'neotree-refresh)
   (define-key evil-normal-state-local-map (kbd "mm") 'neotree-rename-node)
   (define-key evil-normal-state-local-map (kbd "I") 'neotree-hidden-file-toggle)
   (define-key evil-normal-state-local-map (kbd "C") 'neotree-change-root)
))


; Remember the cursor position of files when reopening them
(setq-default save-place t)
(require 'saveplace)

 

(set-frame-font "Inconsolata-dz 11")

;; Fix up parens
(show-paren-mode t)
(setq show-paren-delay 0)

(setq-default show-trailing-whitespace t)      ;; Highlight trailing whitespace

(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)

(setq ido-decorations (quote ("\n↪ "     "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))

;; Map ctrl-j/k to up down in ido selections
(add-hook 'ido-setup-hook
  (lambda ()
    (define-key ido-completion-map (kbd "C-j") 'ido-next-match)
    (define-key ido-completion-map (kbd "C-k") 'ido-prev-match)
))


(evil-commentary-mode)
(global-linum-mode t)            ; Show line numbers
(setq-default truncate-lines t)  ; Don't word wrap
(column-number-mode t)           ; show the column number in the status bar
(blink-cursor-mode 0)            ; Turn off cursor blinking

(set-face-background 'linum "#1c1c1c")
(set-face-foreground 'linum "#787C81")
(set-face-background 'fringe "Black")

(defun uno-email-mode ()
  (interactive)
  (find-file "~/tmp/email.txt")
  (mail-mode)
  (linum-mode -1)
  (writeroom-mode t)
  )

(defun minibuffer-keyboard-quit ()
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))

;; esc quits all the things
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)


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


(require 'powerline)
(setq-default
 mode-line-format
 '("%e"
   (:eval
    (let* ((active (powerline-selected-window-active))
	   (mode-line (if active 'mode-line 'mode-line-inactive))
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
		      (powerline-raw "%l," mode-line 'l)
		      (powerline-raw (format-mode-line '(10 "%c")))
		      (powerline-raw (replace-regexp-in-string  "%" "%%" (format-mode-line '(-3 "%p"))) mode-line 'r))))
      (concat (powerline-render lhs)
	      (powerline-fill mode-line (powerline-width rhs))
	      (powerline-render rhs))))))

