(require 'package)

(setq package-enable-at-startup nil)

(package-initialize)

(require 'cask "/usr/local/share/emacs/site-lisp/cask.el")

(cask-initialize)

(add-to-list 'load-path (expand-file-name "parts" user-emacs-directory))

(require 'custom-prt)
(require 'display-prt)
(require 'requires-prt)
(require 'evil-prt)
(require 'misc-prt)
(require 'utility-functions-prt)
(require 'projectile-functions-prt)
(require 'dired-functions-prt)
(require 'status-line-prt)
(require 'project-prt)
(require 'dired-prt)
(require 'key-bindings-prt)

(provide 'init)

