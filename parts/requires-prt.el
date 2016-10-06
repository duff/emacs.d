
(require 'evil)
(evil-mode 1)

(require 'evil-surround)
(global-evil-surround-mode 1)

(require 'key-chord)
(key-chord-mode 1)

(require 'evil-matchit)
(global-evil-matchit-mode 1)

(require 'flx-ido)
;; (ido-mode 1)
;; (ido-everywhere 1)
(flx-ido-mode 1)
;; (ido-ubiquitous t)

(require 'evil-args)
(require 'elixir-mode)
(require 'ruby-mode)
(require 'ruby-end)
(require 'saveplace)
(require 'ag)
(require 'browse-at-remote)
(require 'web-mode)

(provide 'requires-prt)
