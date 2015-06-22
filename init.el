(require 'package)

(setq package-enable-at-startup nil)

(package-initialize)

(require 'cask "/usr/local/share/emacs/site-lisp/cask.el")

(cask-initialize)

(add-to-list 'load-path (expand-file-name "parts" user-emacs-directory))

(require 'custom-prt)
(require 'display-prt)
(require 'requires-prt)
(require 'anything-prt)
(require 'key-bindings-prt)
(require 'utility-functions-prt)
(require 'status-line-prt)
(require 'writer-prt)

(provide 'init)


