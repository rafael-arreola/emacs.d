;;; package --- init.el -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Emacs Settings
(setq package-enable-at-startup nil)
(setq inhibit-startup-screen t)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq auto-save-list-file-prefix nil)
(setq-default cursor-type 'bar)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(tooltip-mode -1)
(transient-mark-mode -1)
(column-number-mode t)
(global-display-line-numbers-mode t)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Keybinding
(define-key key-translation-map (kbd "ESC") (kbd "C-g"))

;; Package management
(setq custom-file (locate-user-emacs-file "custom.el"))
(add-to-list 'load-path (expand-file-name "start" user-emacs-directory))
(straight-use-package 'use-package)

(require 'up-vertico)
(require 'up-projectile)
(require 'up-neotree)
(require 'up-doom-modeline)
(require 'up-company)
(require 'up-gruvbox)
(require 'up-lsp-mode)
(require 'up-flycheck)
(require 'up-rainbow)
(require 'up-hltodo)
;;Langs
(require 'javascript)
;;; init.el ends here
