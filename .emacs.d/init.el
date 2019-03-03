;; Configure package.el to include MELPA.
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Ensure that use-package is installed.
;;
;; If use-package isn't already installed, it's extremely likely that this is a
;; fresh installation! So we'll want to update the package repository and
;; install use-package before loading the literate configuration.
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

(org-babel-load-file "~/.emacs.d/configuration.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   (quote
    ("~/Documents/Dropbox/org/inbox.org" "~/Documents/Dropbox/org/index.org")))
 '(package-selected-packages
   (quote
    (vue-mode evil-magit go-eldoc company-ghc ghc ghc-mod engine-mode wgrep smex flx counsel helpful dired-open dired-hide-dotfiles deft synosaurus zenburn-theme yard-mode yaml-mode which-key web-mode use-package slim-mode scss-mode scala-mode sbt-mode ruby-end rspec-mode rainbow-delimiters python-mode py-autopep8 projectile-rails powerline-evil paredit org-bullets multi-term keychain-environment interleave helm haskell-mode haml-mode graphviz-dot-mode go-guru go-errcheck go-autocomplete gnuplot flycheck-package fancy-battery exec-path-from-shell evil-visual-mark-mode evil-surround evil-org evil-collection elpy ein ebib dumb-jump diminish diff-hl dashboard company-quickhelp company-jedi company-go company-coq company-auctex coffee-mode chruby auto-package-update auto-compile ag))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(markdown-code-face ((t nil))))
