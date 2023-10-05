(require 'package)
;;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; close welecom page
(setq inhibit-splash-screen t)  

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
 '(package-selected-packages
   '(tabbar org-bullets which-key try auto-complete evil dracula-theme goto-chg ereader)))
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
  :ensure t
  :config
  (which-key-mode))

;;Org-mode stuff
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))


(setq indo-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(defalias 'list-buffers 'ibuffer-other-window)
;;(defalias 'list-buffers 'ibuffer)


(use-package tabbar
  :ensure t
  :config
  (tabbar-mode 1))
