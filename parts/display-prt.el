
(set-background-color "black")

;; Startup big
(add-to-list 'default-frame-alist '(height . 49))
(add-to-list 'default-frame-alist '(width . 178))

(set-frame-font "Hack 11")

;; No menubar, toolbar, scrollbar
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq inhibit-startup-screen t)
(setq ns-use-native-fullscreen nil)

;; Make scrolling less jumpy
(setq scroll-margin 5
scroll-conservatively 9999
scroll-step 1)

;; Fix up parens
(show-paren-mode t)
(setq show-paren-delay 0)

;; Don't higlight the paren / quote area
(setq sp-highlight-pair-overlay nil)
(setq sp-highlight-wrap-overlay nil)
(setq sp-highlight-wrap-tag-overlay nil)

;; Highlight trailing whitespace
(setq-default show-trailing-whitespace t)

(global-linum-mode t)                     ;; Show line numbers
(setq-default truncate-lines t)           ;; Don't word wrap
(blink-cursor-mode 0)                     ;; Turn off cursor blinking
(set-face-background 'fringe "Black")     ;; Pretty up edge area near line numbers

;; Remove noise from neotree
(setq neo-show-updir-line nil)
(setq neo-banner-message nil)
(setq neo-theme 'arrow)
(setq neo-mode-line-type 'none)
(setq neo-window-width 34)

;; Pretty up line numbers
(set-face-background 'linum "#1c1c1c")
(set-face-foreground 'linum "#787C81")

(setq ido-decorations (quote ("\n↪ "     "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))

(provide 'display-prt)
