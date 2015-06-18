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

(setq inhibit-startup-screen t)
(setq ns-use-native-fullscreen nil)

(add-to-list 'default-frame-alist '(height . 58))
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
  )

(require 'key-chord)(key-chord-mode 1)
(key-chord-define evil-insert-state-map ";;" 'evil-normal-state)
(key-chord-define evil-visual-state-map ";;" 'evil-change-to-previous-state)

