(require 'js2-mode)

(add-to-list 'auto-mode-alist '("\\.js" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(eval-after-load 'js2-mode
  '(progn
     (defun t-js-mode-defaults ()
       (setq tab-width 2)
       (setq js2-basic-offset 2)
       (smartparens-mode +1)
       (setq mode-name "JS2")
       )

     (add-hook 'js2-mode-hook 't-js-mode-defaults)))

(provide 'js-prt)
