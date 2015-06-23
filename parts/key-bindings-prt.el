(global-set-key (kbd "<s-return>") 'toggle-frame-fullscreen)
(global-set-key (kbd "C-l")  'windmove-right)
(global-set-key (kbd "C-h")  'windmove-left)
(global-set-key (kbd "C-k")  'windmove-up)
(global-set-key (kbd "C-j")  'windmove-down)

(global-set-key (kbd "M-x") 'smex)   ;; use smex

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
  "p" 'projectile-switch-project
  "b" 'ido-switch-buffer
  "e" 'uno-email-mode
  "t" 'toggle-to-previous-buffer
  "RET" 'add-enter
  "SPC" (lambda() (interactive)(insert (kbd "<SPC>")))
  "F"   (lambda() (interactive)(projectile-find-file "t"))
  "c"   (lambda() (interactive)(find-file "~/.emacs.d/init.el"))
  )


;; Improved escape
(key-chord-define evil-insert-state-map ";;" 'evil-normal-state)
(key-chord-define evil-visual-state-map ";;" 'evil-change-to-previous-state)

(define-key evil-normal-state-map "gl" 'move-end-of-line)
(define-key evil-normal-state-map "gh" 'back-to-indentation)

;; Help with long lines
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

;; Bubble lines
(define-key evil-normal-state-map (kbd "M-k") (kbd "ddkP"))
(define-key evil-normal-state-map (kbd "M-j") (kbd "ddp"))
(define-key evil-visual-state-map (kbd "M-k") (kbd "xkP`[V`]"))
(define-key evil-visual-state-map (kbd "M-j") (kbd "xp`[V`]"))

(define-key evil-insert-state-map (kbd "S-SPC") 'company-complete)

;; Move up down in auto complete
(define-key company-active-map (kbd "C-j") 'company-select-next)
(define-key company-active-map (kbd "C-k") 'company-select-previous)

(define-key evil-normal-state-map (kbd "C-\\") '(lambda() (interactive)(find-tag (find-tag-default))))

;; Jump to matching parens
(define-key evil-normal-state-map (kbd "SPC") 'evilmi-jump-items)

;; Make an arg text object act like a comma object
(define-key evil-inner-text-objects-map "," 'evil-inner-arg)
(define-key evil-outer-text-objects-map "," 'evil-outer-arg)

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

;; Map ctrl-j/k to up down in ido selections
(add-hook 'ido-setup-hook
  (lambda ()
    (define-key ido-completion-map (kbd "C-j") 'ido-next-match)
    (define-key ido-completion-map (kbd "C-k") 'ido-prev-match)
))

;; esc quits all the things
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)


(provide 'key-bindings-prt)
