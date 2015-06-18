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

(add-to-list 'default-frame-alist '(height . 53))
(add-to-list 'default-frame-alist '(width . 178))

(global-set-key (kbd "<s-return>") 'toggle-frame-fullscreen)

;; Save histories
(setq savehist-additional-variables '(search-ring regexp-search-ring))
(savehist-mode 1)

(require 'evil)
(evil-mode 1)

(global-evil-leader-mode)
(evil-leader/set-leader ",")

(evil-leader/set-key
  "w"  'save-buffer
  "v" 'split-window-right
  "s" 'split-window-below
  "d" 'neotree-toggle
  "n" 'neotree-find
  )

(require 'key-chord)(key-chord-mode 1)
(key-chord-define evil-insert-state-map ";;" 'evil-normal-state)
(key-chord-define evil-visual-state-map ";;" 'evil-change-to-previous-state)

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
))


