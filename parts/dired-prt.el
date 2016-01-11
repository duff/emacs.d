(require 'dired-x)

;; Auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)

(require 'ls-lisp)
(setq ls-lisp-use-insert-directory-program t)
(setq insert-directory-program "/usr/local/Cellar/coreutils/8.24/libexec/gnubin/ls")

(setq dired-listing-switches "--group-directories-first -alh")

(provide 'dired-prt)
