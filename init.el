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

(require 'evil)
(evil-mode 1)

