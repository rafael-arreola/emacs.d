;;; up-lsp-mode.el -*- lexical-binding t; -*-
(use-package lsp-mode
  :straight t
  :init (setq lsp-keymap-prefix "C-l")
  :hook (
         (go-mode . lsp)
	 (emacs-lisp-mode .lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)


(use-package lsp-ui
  :straight t
  :commands lsp-ui-mode)

(use-package lsp-treemacs
  :straight t
  :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
(use-package dap-mode
  :straight t)

;; optional if you want which-key integration
(use-package which-key
  :straight t
  :config (which-key-mode))

(provide 'up-lsp-mode)
