(require 'cl)
(require 'package)

(package-initialize)
(package-refresh-contents)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(defvar ahart/packages '(evil
                         magit
			 org
			 prettier-js
			 solarized-theme
			  )
  "Default packages")

(defun ahart/packages-installed-p ()
  (loop for pkg in ahart/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

(unless (ahart/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg ahart/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(global-set-key (kbd "C-x g") 'magit-status)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (magit))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Enable Evil
(require 'evil)
(evil-mode 1)

(setq inhibit-splash-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; spaces
(setq tab-width 2
      indent-tabs-mode nil)

;; theme
(load-theme 'solarized-dark t)

;; Org Mode
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

;; Prettier
(require 'prettier-js)
(add-hook 'js-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)
