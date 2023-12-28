(require 'package)
;;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
:(setq package-archives '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
                         ("melpa"  . "https://melpa.org/packages/")))
;(add-to-list 'package-archives
;            '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;(add-to-list 'package-archives
;            '("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/") t)
;(add-to-list 'package-archives
;            '("nognu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/") t)

(package-initialize)

;;auto added
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("f25f174e4e3dbccfcb468b8123454b3c61ba94a7ae0a870905141b050ad94b8f" default))
 '(org-agenda-files '("/home/zhxworld/myorg/orgfiles/gcal.org"))
 '(package-selected-packages
   '(org-noter-pdftools org-pdftools synosaurus restart-emacs eyebrowse auto-yasnippet company-jedi pdf-tools ack git-timemachine git-gutter magit wgrep-ag wgrep pcre2el treemacs-tab-bar treemacs-projectile counsel-projectile ace-window dumb-jump projectile elfeed-org elfeed-goodies elfeed iedit expand-region aggressive-indent jedi virtualenvwrapper elpy benchmark-init yasnippet-classic-snippets yasnippet-snippets htmlize ox-reveal weblorg swagger-to-org org-babel-eval-in-repl org-clock-csv org-gcal zenburn-theme color-theme-sanityinc-tomorrow color-theme avy counsel swiper switch-window hungry-delete crux drag-stuff tabbar org-bullets try auto-complete evil dracula-theme goto-chg ereader)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))

(ac-config-default)
;;auto install package defined in .emacs file
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;org-mode
;(add-to-list 'load-path "/home/zhxworld/.emacs.d/org-mode/lisp")
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)
(global-set-key (kbd "C-c t") #'org-toggle-link-display)

(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))

;; Minimize garbage collection during startup
;(setq gc-cons-threshold most-positive-fixnum)
(setq gc-cons-threshold (* 50 1000 1000))
;; Lower threshold back to 8 MiB (default is 800kB)
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (expt 2 25))))
(setq message-log-max t)

;(setq org-todo-keywords '((type "Fred" "Sara" "Lucy" "|" "DONE")))
(setq org-todo-keywords
      '((sequence "TODO" "|" "DONE")
        (sequence "REPORT" "BUG" "KNOWNCAUSE" "|" "FIXED")
        (sequence "|" "CANCELED")))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
