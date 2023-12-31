(setq inhibit-startup-message t)  
    (tool-bar-mode -1)
    (fset 'yes-or-no-p 'y-or-n-p)


    ;;(global-set-key (kdb "<f5>") 'revert-buffer)
    (global-set-key [f5] 'revert-buffer)
    (global-set-key [f6] 'eval-buffer)
    (global-set-key [f7] 'package-install)
    (toggle-frame-maximized)
    (use-package emacs
      :config
      (setq display-line-numbers-type t)
      (global-display-line-numbers-mode t))

;;    (defun my-split-window-right ()
;;    "Split window with another buffer."
;;    (interactive)
;;    (select-window (split-window-right))
;;    (switch-to-buffer (other-buffer)))
;;
;;  (bind-key "C-x 3" #'my-split-window-right)

  (defun split-window-right-and-move-cursor ()
  (interactive)
  (split-window-right)
  (other-window 1))
  (bind-key "C-x 3" #'split-window-right-and-move-cursor)

  (defun split-window-below-and-move-cursor ()
  (interactive)
  (split-window-below)
  (other-window 1))
  (bind-key "C-x 2" #'split-window-below-and-move-cursor)

  (global-set-key (kbd "<escape>") 'keyboard-quit)

;; show the number
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(use-package which-key
  :defer nil
  :ensure t
  :config
  (which-key-mode))

(use-package try
 :ensure t)

;(use-package tabbar
; :ensure t
;  :config
;  (tabbar-mode 1))

;;Org-mode stuff
  (require 'org-bullets)
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

  (setq browse-url-browser-function 'browse-url-generic
        browse-url-generic-program "chromium")

  (global-set-key (kbd "C-c c") 'org-capture)

  (setq org-agenda-files (list "~/myorg/orgfiles/gcal.org"
                               "~/myorg/orgfiles/soe-cal.org"
                               "~/myorg/orgfiles/i.org"
                               "~/myorg/orgfiles/schedule.org"))
  (setq org-capture-templates
        '(("a" "Appointment" entry (file  "~/myorg/orgfiles/gcal.org" )
           "* %?\n\n%^T\n\n:PROPERTIES:\n\n:END:\n\n")
          ("l" "Link" entry (file+headline "~/myorg/orgfiles/links.org" "Links")
           "* %? %^L %^g \n%T" :prepend t)
          ("b" "Blog idea" entry (file+headline "~/myorg/orgfiles/i.org" "Blog Topics:")
           "* %?\n%T" :prepend t)
          ("t" "To Do Item" entry (file+headline "~/myorg/orgfiles/i.org" "To Do and Notes")
           "* TODO %?\n%u" :prepend t)
          ("m" "Mail To Do" entry (file+headline "~/myorg/orgfiles/i.org" "To Do and Notes")
           "* TODO %a\n %?" :prepend t)
          ("g" "GMail To Do" entry (file+headline "~/myorg/orgfiles/i.org" "To Do and Notes")
           "* TODO %^L\n %?" :prepend t)
          ("n" "Note" entry (file+headline "~/myorg/orgfiles/i.org" "Notes")
           "* %u %? " :prepend t)
          ))
      (defadvice org-capture-finalize 
        (after delete-capture-frame activate)  
      "Advise capture-finalize to close the frame"  
      (if (equal "capture" (frame-parameter nil 'name))  
          (delete-frame)))

    (defadvice org-capture-destroy 
        (after delete-capture-frame activate)  
      "Advise capture-destroy to close the frame"  
      (if (equal "capture" (frame-parameter nil 'name))  
          (delete-frame)))  

    (use-package noflet
      :ensure t )
    (defun make-capture-frame ()
      "Create a new frame and run org-capture."
      (interactive)
      (make-frame '((name . "capture")))
      (select-frame-by-name "capture")
      (delete-other-windows)
      (noflet ((switch-to-buffer-other-window (buf) (switch-to-buffer buf)))
        (org-capture)))
;; (require 'ox-beamer)
;; for inserting inactive dates
    (define-key org-mode-map (kbd "C-c >") (lambda () (interactive (org-time-stamp-inactive))))

(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
     (global-auto-complete-mode t)
     ))

(use-package counsel
           :ensure t)

(use-package counsel
       :ensure t
         :bind
         (("M-y" . counsel-yank-pop)
          :map ivy-minibuffer-map
          ("M-y" . ivy-next-line)))

       
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
             ;(global-set-key (kbd "C-c C-r") 'ivy-resume)
             ;(global-set-key (kbd "<f6>") 'ivy-resume)
             (global-set-key (kbd "M-x") 'counsel-M-x)
             (global-set-key (kbd "C-x C-f") 'counsel-find-file)
             ;(global-set-key (kbd "<f1> f") 'counsel-describe-function)
             ;(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
             ;(global-set-key (kbd "<f1> o") 'counsel-describe-symbol)
             ;(global-set-key (kbd "<f1> l") 'counsel-find-library)
             ;(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
             ;(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
             ;(global-set-key (kbd "C-c g") 'counsel-git)
             ;(global-set-key (kbd "C-c j") 'counsel-git-grep)
             (global-set-key (kbd "C-c k") 'counsel-ag)
             ;(global-set-key (kbd "C-x l") 'counsel-locate)
             ;(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
             ;(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
             ))

(use-package avy
:ensure t
:bind ("M-s" . avy-goto-char))

;;Enable Evil
(require 'evil)
;(evil-mode 1)
(global-set-key [f8] 'evil-mode)

;  (use-package color-theme
;    :ensure t)
;
;  (use-package zenburn-theme
;    :ensure t
;    :config (load-theme 'zenburn t))


  ;; set dark theme
  ;;(load-theme 'leudraculaven-dark t)
  (load-theme 'dracula t)

  ;; set font
  (set-face-attribute 'default nil :height 130)

(setq indo-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;;(defalias 'list-buffers 'ibuffer-other-window)
(defalias 'list-buffers 'ibuffer)

;;(use-package drag-stuff
;;  :bind(("<M-up>". drag-stuff-up)
;;	("<M-down>" . drag-stuff-down)))

(use-package hungry-delete
  :ensure t
  :config
  (global-hungry-delete-mode))

(use-package crux
  :bind ("C-c k" . crux-smart-kill-line))

(use-package ox-reveal
 :ensure t
 :config
   (require 'ox-reveal)
;   (setq org-reveal-root "http://cdn.jsdelivr.net/reveal.js/3.0.0/")
   (setq org-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js")
   (setq org-reveal-mathjax t))

  (use-package htmlize
  :ensure t)

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

(use-package yasnippet
  :ensure t
  :init
    (yas-global-mode 1))

(use-package yasnippet-snippets
  :ensure t)

;; Startup time
(defun efs/display-startup-time ()
  (message
   "Emacs loaded in %s with %d garbage collections."
   (format
    "%.2f seconds"
    (float-time
     (time-subtract after-init-time before-init-time)))
   gcs-done))

(add-hook 'emacs-startup-hook #'efs/display-startup-time)

(use-package benchmark-init
:ensure t
:config
;; To disable collection of benchmark data after init is done.
(add-hook 'after-init-hook 'benchmark-init/deactivate))

(setq py-python-command "/appcom/Anaconda3Install/anaconda3-2023/bin/python3")
        (setq python-shell-interpreter "/appcom/Anaconda3Install/anaconda3-2023/bin/python3")
 

(use-package jedi
     :ensure t
     :init
     (add-hook 'python-mode-hook 'jedi:setup)
     (add-hook 'python-mode-hook 'jedi:ac-set))

   (use-package elpy
        :ensure t
        :config
        (elpy-enable))
        ;(use-package elpy
        ;    :ensure t
        ;    :custom (elpy-rpc-backend "jedi")
        ;    :config 
        ;    (elpy-enable))

;        (use-package virtualenvwrapper
;          :ensure t
;          :config
;          (venv-initialize-interactive-shells)
;          (venv-initialize-eshell))

(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode))

;hightlight the line
(global-hl-line-mode t)

;focus you cursor
(use-package beacon
  :ensure t
  :config
  (beacon-mode 1))

(use-package aggressive-indent
  :ensure t
  :config
  (global-aggressive-indent-mode 1))

;select more region smartly
(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-=") 'er/expand-region))

(setq save-interprogram-paste-before-kill t)

(use-package iedit
  :ensure t)
(bind-key "C-," #'iedit-mode-toggle-on-function)

					; if you're windened, narrow to the region, if you're narrowed, widen
					; bound to C-x n
(defun narrow-or-widen-dwim (p)
  "If the buffer is narrowed, it widens. Otherwise, it narrows intelligently.
Intelligently means: region, org-src-block, org-subtree, or defun,
whichever applies first.
Narrowing to org-src-block actually calls `org-edit-src-code'.

With prefix P, don't widen, just narrow even if buffer is already
narrowed."
  (interactive "P")
  (declare (interactive-only))
  (cond ((and (buffer-narrowed-p) (not p)) (widen))
	((region-active-p)
	 (narrow-to-region (region-beginning) (region-end)))
	((derived-mode-p 'org-mode)
	 ;; `org-edit-src-code' is not a real narrowing command.
	 ;; Remove this first conditional if you don't want it.
	 (cond ((ignore-errors (org-edit-src-code))
		(delete-other-windows))
	       ((org-at-block-p)
		(org-narrow-to-block))
	       (t (org-narrow-to-subtree))))
	(t (narrow-to-defun))))

;; (define-key endless/toggle-map "n" #'narrow-or-widen-dwim)
;; This line actually replaces Emacs' entire narrowing keymap, that's
;; how much I like this command. Only copy it if that's what you want.
(define-key ctl-x-map "n" #'narrow-or-widen-dwim)

(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.vue?\\'" . web-mode))
  (setq web-mode-engines-alist
	'(("django"    . "\\.html\\'")))
  (setq web-mode-ac-sources-alist
	'(("css" . (ac-source-css-property))
	  ("vue" . (ac-source-words-in-buffer ac-source-abbrev))
          ("html" . (ac-source-words-in-buffer ac-source-abbrev))))
  (setq web-mode-enable-auto-closing t))
(setq web-mode-enable-auto-quoting t) ; this fixes the quote problem I mentioned
