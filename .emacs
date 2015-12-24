(require 'package)
  (push '("marmalade" . "http://marmalade-repo.org/packages/")
        package-archives )
  (push '("melpa" . "http://melpa.milkbox.net/packages/")
        package-archives)
(package-initialize)


;;display Visited File's Path in the Frame Title
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;;(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)




;;ido-mode configurations
(ido-mode 1)

;;smex configurations						  ;;
(require 'smex) ; Not needed if you use package.el			  ;;
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay ;;
                  ; when Smex is auto-initialized on its first run.	  ;;
(global-set-key (kbd "M-x") 'smex)					  ;;
(global-set-key (kbd "M-X") 'smex-major-mode-commands)		  ;;
;; This is your old M-x.						  ;;
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)	  ;;


;;move-text configurations
(require 'move-text)
(move-text-default-bindings)

;; no startup msg  
(setq inhibit-startup-message t)

;;Turn off alarms completely
(setq ring-bell-function 'ignore)

;anzu configurations
(global-anzu-mode +1)

;smartparens configurations
;;(smartparens-global-mode t)
;;(require 'smartparens-config)

;;Show Paren Mode configurations
;; (show-paren-mode 1)
;; (setq show-paren-delay 0)
;; (require 'paren)

;highlight-parentheses configurations
(require 'highlight-parentheses)
(global-highlight-parentheses-mode t)

;;window switching settings
(define-key global-map (kbd "M-p") 'previous-multiframe-window)
(define-key global-map (kbd "M-n") 'other-window)


;;expand-region configurations
(require 'expand-region)
(global-set-key (kbd "M-RET") 'er/expand-region)

;;Indent Region or Buffer
(defun indent-buffer ()
  "Indent the currently visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer ()
  "Indent a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (message "Indented selected region."))
      (progn
        (indent-buffer)
        (message "Indented buffer.")))))
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;;whole line or region
(whole-line-or-region-mode t)

;;DeleteSelectionMode
(delete-selection-mode 1)

;;Tabs settings
(setq-default indent-tabs-mode nil)
(define-key global-map (kbd "RET") 'newline-and-indent)
(setq-default tab-width 4)

;;dtrt-mode configurations
(require 'dtrt-indent)
(dtrt-indent-mode 1)

;;syntax-table settings
(add-hook 'c-mode-common-hook #'(lambda () (modify-syntax-entry ?_ "w")))
(add-hook 'js2-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))

;;yesornop settings
(defalias 'yes-or-no-p 'y-or-n-p)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-paren-face ((t (:underline "gold"))) t)
 '(isearch ((t (:background "#d33682" :foreground "color-45" :inverse-video t :weight normal))))
 '(lazy-highlight ((t (:background "#b58900" :foreground "color-51" :inverse-video t :weight normal))))
 '(region ((t (:background "#586e75" :foreground "#e3e3d3" :inverse-video t)))))

;;electric-pair-mode settings
(electric-pair-mode 1)

;;auctex set
(load "auctex.el" nil t t)
(setq Tex-auto-save t)
(setq Tex-parse-self t)
(setq-default Tex-master nil)

;;js2-mode configurations
;;(autoload 'js2-mode "js2-mode" nil t)
;;(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;;js3-mode configurations
(autoload 'js3-mode "js3-mode" nil t)
;;(add-to-list 'auto-mode-alist '("\\.js\\'" . js3-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . js3-mode))

;;markdown mode
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;;projectile
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

;;hungry delete mode
(require 'hungry-delete)
(global-hungry-delete-mode)

;;enable undo-tree-mode globally
;;(global-undo-tree-mode)




;;Encoding for Terminal.app on OS X
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (sanityinc-solarized-light)))
 '(custom-safe-themes
   (quote
    ("b809c70eeba09728804ebfbd16bf40f408c1dbe751b94330ff9e8d14a77b3370" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "7150065da63ff34277f2d2490d5f2423a9c9327c026cc5e6be5166cc514de24f" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "8f2e60e25bd33a29f45867d99c49afd9d7f3f3ed8a60926d32d5a23c790de240" "c006bc787154c31d5c75e93a54657b4421e0b1a62516644bd25d954239bc9933" "ffe39e540469ef05808ab4b75055cc81266875fa4a0d9e89c2fec1da7a6354f3" "ad24ea739f229477ea348af968634cb7a0748c9015110a777c8effeddfa920f5" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "eafda598b275a9d68cc1fbe1689925f503cab719ee16be23b10a9f2cc5872069" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "b06aaf5cefc4043ba018ca497a9414141341cb5a2152db84a9a80020d35644d1" "4c9ba94db23a0a3dea88ee80f41d9478c151b07cb6640b33bfc38be7c2415cc4" default)))
 '(fci-rule-color "#383838")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   (quote
    (("#eee8d5" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#69B7F0" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#eee8d5" . 100))))
 '(hl-bg-colors
   (quote
    ("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 '(hl-fg-colors
   (quote
    ("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(hl-paren-colors (quote ("darkblue")))
 '(js3-enter-indents-newline t)
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   (quote
    (ensime highlight-indentation moe-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized hungry-delete projectile scala-mode2 js3-mode company whole-line-or-region thing-cmds nyan-mode helm-projectile magit helm-swoop helm-ag dtrt-indent smex helm w3m expand-region highlight-parentheses smart-mode-line smartparens markdown-mode evil auctex ag anti-zenburn-theme ample-theme leuven-theme solarized-theme anzu move-text zenburn-theme nzenburn-theme)))
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(scroll-preserve-screen-position t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(tool-bar-mode nil)
 '(vc-annotate-background "#2b2b2b")
 '(vc-annotate-color-map
   (quote
    ((20 . "#bc8383")
     (40 . "#cc9393")
     (60 . "#dfaf8f")
     (80 . "#d0bf8f")
     (100 . "#e0cf9f")
     (120 . "#f0dfaf")
     (140 . "#5f7f5f")
     (160 . "#7f9f7f")
     (180 . "#8fb28f")
     (200 . "#9fc59f")
     (220 . "#afd8af")
     (240 . "#bfebbf")
     (260 . "#93e0e3")
     (280 . "#6ca0a3")
     (300 . "#7cb8bb")
     (320 . "#8cd0d3")
     (340 . "#94bff3")
     (360 . "#dc8cc3"))))
 '(vc-annotate-very-old-color "#dc8cc3")
 '(weechat-color-list
   (quote
    (unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496"))))

;;enable highlight indentation current column mode
(add-hook 'prog-mode-hook 'highlight-indentation-current-column-mode)

(load-theme 'solarized-light t)

;;smart-mode-line configurations
;;(setq sml/theme 'respectful)
(sml/setup)

;; Enable mouse support
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] '(lambda ()
                              (interactive)
                              (scroll-down 1)))
  (global-set-key [mouse-5] '(lambda ()
                              (interactive)
                              (scroll-up 1)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t))

;;;
;; Move to beginning of word before yanking word in isearch-mode.
;; Make C-s C-w and C-r C-w act like Vim's g* and g#, keeping Emacs'
;; C-s C-w [C-w] [C-w]... behaviour.
(require 'thingatpt)
(defun my-isearch-yank-word-or-char-from-beginning ()
  "Move to beginning of word before yanking word in isearch-mode."
  (interactive)
  ;; Making this work after a search string is entered by user
  ;; is too hard to do, so work only when search string is empty.
  (if (= 0 (length isearch-string))
      (beginning-of-thing 'word))
  (isearch-yank-word-or-char)
  ;; Revert to 'isearch-yank-word-or-char for subsequent calls
  (substitute-key-definition 'my-isearch-yank-word-or-char-from-beginning 
			     'isearch-yank-word-or-char
			     isearch-mode-map))

(add-hook 'isearch-mode-hook
 (lambda ()
   "Activate my customized Isearch word yank command."
   (substitute-key-definition 'isearch-yank-word-or-char 
			      'my-isearch-yank-word-or-char-from-beginning
			      isearch-mode-map)))

;;set cursor style
(setq-default cursor-type 'bar)

;;font customization
(set-default-font "-*-Source Code Pro-light-normal-normal-*-*-*-*-*-m-0-iso10646-1")
