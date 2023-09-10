(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; close welecom page
(setq inhibit-splash-screen t)  

;; set dark theme
(load-theme 'leuven-dark t)

(set-face-attribute 'default nil :height 140)
