(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages"))

(setq package-enable-at-startup nil)
(package-initialize)


;; switch C-x with C-u
(define-key key-translation-map [?\C-x] [?\C-u])
(define-key key-translation-map [?\C-u] [?\C-x])

;; leave insert and replace mode
(with-eval-after-load 'evil-maps
  (define-key evil-insert-state-map (kbd "C-c") 'evil-force-normal-state)
  (define-key evil-visual-state-map (kbd "C-c") 'evil-force-normal-state)
  (define-key evil-replace-state-map (kbd "C-c") 'evil-force-normal-state))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (gruvbox-dark-medium)))
 '(custom-safe-themes
   (quote
    ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "c63a789fa2c6597da31f73d62b8e7fad52c9420784e6ec34701ae8e8f00071f6" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(global-linum-mode t)
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (auctex helm all-the-icons use-package evil-magit smart-mode-line magit gruvbox-theme evil)))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(require 'helm-config)
;; add use package
(require 'use-package)

;; add icons to everywhere???
(require 'all-the-icons)

;; add magit with evil bindings
(require 'evil-magit)

;; add evil mode and turn it on by default
(require 'evil)
(evil-mode t)
;; start smart-mode-line
;;(setq sml/theme 'powerline) looks ugly ???
(require 'smart-mode-line)
(sml/setup)
(setq sml/no-confirm-load-theme t)

;; load themes at the start
(load-theme 'gruvbox-dark-medium t)
(load-theme 'smart-mode-line-respectful t)

;; global shortcuts
;; magit
(global-set-key (kbd "C-x g") 'magit-status)

;; save session
(desktop-save-mode t)

;; auctex stuff
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
