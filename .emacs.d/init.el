(add-to-list 'load-path "/Users/Benny.Tsai/Projects/better-defaults")

(require 'better-defaults)

(require 'package)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(cider
                      company
                      paredit
                      smex
                      solarized-theme))

(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))

;; hooks
(add-hook 'after-init-hook #'global-company-mode)
(add-hook 'cider-mode-hook #'eldoc-mode)
(add-hook 'cider-repl-mode-hook #'eldoc-mode)
(add-hook 'cider-repl-mode-hook #'paredit-mode)
(add-hook 'clojure-mode-hook #'paredit-mode)

;; JavaScript
(setq js-indent-level 2)

;; XML
(setq nxml-child-indent 2 nxml-attribute-indent 2)

;; key bindings
(global-set-key (kbd "M-x") 'smex)

;; OSX hacks
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))
(setq visible-bell nil)

;; misc.
(column-number-mode t)
(load-theme 'solarized-dark t)
(server-start)
(setq inhibit-startup-screen t)
(setq initial-scratch-message "")
