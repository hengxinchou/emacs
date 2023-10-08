(require 'package)
;;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; close welecom page
(setq inhibit-startup-message t)  
(tool-bar-mode -1)

;; set dark theme
;;(load-theme 'leudraculaven-dark t)
(load-theme 'dracula t)

;; set font
(set-face-attribute 'default nil :height 130)

;;auto added
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("f25f174e4e3dbccfcb468b8123454b3c61ba94a7ae0a870905141b050ad94b8f" default))
 '(package-selected-packages
   '(zenburn-theme color-theme-sanityinc-tomorrow color-theme avy counsel swiper switch-window hungry-delete crux drag-stuff tabbar org-bullets which-key try auto-complete evil dracula-theme goto-chg ereader)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;Enable Evil
;;(require 'evil)
;;(evil-mode 1)

;;org-mode
(add-to-list 'load-path "/home/zhxworld/.emacs.d/org-mode/lisp")
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(ac-config-default)
;;auto install package defined in .emacs file
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package try
  :ensure t)

(use-package which-key
  :defer nil
  :ensure t
  :config
  (which-key-mode))

;;Org-mode stuff
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))


(setq indo-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;;(defalias 'list-buffers 'ibuffer-other-window)
(defalias 'list-buffers 'ibuffer)


(use-package tabbar
  :ensure t
  :config
  (tabbar-mode 1))

;; show the number
(use-package emacs
  :config
  (setq display-line-numbers-type t)
  (global-display-line-numbers-mode t))

;;(use-package drag-stuff
;;  :bind(("<M-up>". drag-stuff-up)
;;	("<M-down>" . drag-stuff-down)))

(use-package crux
  :bind ("C-c k" . crux-smart-kill-line))


;;(use-package hungry-delete
;;  :bind (("C-c DEL" . hungry-delete-backward))
;;  :bind (("C-c d" . hungry-delete-forward)))
  
(defalias 'yes-or-no-p 'y-or-n-p)



;;(require 'switch-window)
;;(global-set-key (kbd "C-x o") 'switch-window)
;;(global-set-key (kbd "C-x 1") 'switch-window-then-maximize)
;;(global-set-key (kbd "C-x 2") 'switch-window-then-split-below)
;;(global-set-key (kbd "C-x 3") 'switch-window-then-split-right)
;;(global-set-key (kbd "C-x 0") 'switch-window-then-delete)
;;(global-set-key (kbd "C-x 4 d") 'switch-window-then-dired)
;;(global-set-key (kbd "C-x 4 f") 'switch-window-then-find-file)
;;(global-set-key (kbd "C-x 4 m") 'switch-window-then-compose-mail)
;;(global-set-key (kbd "C-x 4 r") 'switch-window-then-find-file-read-only)
;;(global-set-key (kbd "C-x 4 C-f") 'switch-window-then-find-file)
;;(global-set-key (kbd "C-x 4 C-o") 'switch-window-then-display-buffer)
;;(global-set-key (kbd "C-x 4 0") 'switch-window-then-kill-buffer)

(use-package counsel
  :ensure t)

(use-package swiper
  :ensure t
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq enable-recursive-minibuffers t)
    ;; enable this if you want `swiper' to use it
    ;; (setq search-default-mode #'char-fold-to-regexp)
    (global-set-key "\C-s" 'swiper)
    (global-set-key (kbd "C-c C-r") 'ivy-resume)
    (global-set-key (kbd "<f6>") 'ivy-resume)
    (global-set-key (kbd "M-x") 'counsel-M-x)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    (global-set-key (kbd "<f1> f") 'counsel-describe-function)
    (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
    (global-set-key (kbd "<f1> o") 'counsel-describe-symbol)
    (global-set-key (kbd "<f1> l") 'counsel-find-library)
    (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
    (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
    (global-set-key (kbd "C-c g") 'counsel-git)
    (global-set-key (kbd "C-c j") 'counsel-git-grep)
    (global-set-key (kbd "C-c k") 'counsel-ag)
    (global-set-key (kbd "C-x l") 'counsel-locate)
    (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
    (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)))

(use-package avy
  :ensure t
  :bind ("M-s" . avy-goto-char))


(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
     (global-auto-complete-mode t)
     ))

;;(use-package color-theme
;;  :ensure t)

;;(use-package zenburn-theme
;;  :ensure t
;;  :config (load-theme 'zenburn t))
