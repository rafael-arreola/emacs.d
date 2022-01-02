;;; package --- javascript.el

;;; Commentary:
;;; Code:
(use-package eldoc :straight t)
(use-package typescript-mode :straight t)
(use-package tide
  :straight t
  :after (typescript-mode company flycheck)
  :config (set-company-backend! 'tide-mode 'company-tide)
  :hook ((typescript-mode . tide-setup)
          (typescript-mode . tide-hl-identifier-mode)
          (before-save . tide-format-before-save))
  )
(use-package rjsx-mode
  :straight t
  :mode "\\.[mc]?js\\'"
  :mode "\\.tsx\\'"
  :mode "\\.es6\\'"
  :mode "\\.pac\\'"
  :interpreter "node"
  )
(use-package web-mode
  :straight t
  :after (tide))
(use-package prettier-js :straight t)
(use-package add-node-modules-path :straight t)
(use-package emmet-mode :straight t)
(use-package js2-mode :straight t)

;; Configure
(setq-default flycheck-disabled-checkers (append flycheck-disabled-checkers
						 '(javascript-jshint json-jsonlist)))
(setq company-tooltip-align-annotations t)
(setq tide-format-options '(:insertSpaceAfterFunctionKeywordForAnonymousFunctions t :placeOpenBraceOnNewLineForFunctions nil :convertTabsToSpaces t :tabSize 2 :indentSize 2))
(add-to-list 'auto-mode-alist '("\\.jsx\\'"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.htmlx\\'" . web-mode))
(setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")
				     ("tsx" . "\\.ts[x]?\\'")))
(setq web-mode-markup-ident-offset 2)

(defun init-web-mode-hook ()
  (interactive)
  (add-node-modules-path)
  (prettier-js-mode)
  (js2-minor-mode)
  (emmet-mode)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))
(defun init-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))


(flycheck-add-mode 'javascript-eslint 'web-mode)
(flycheck-add-mode 'javascript-eslint 'typescript-mode)
(flycheck-add-mode 'javascript-eslint 'typescript-tsx-mode)
(flycheck-add-mode 'typescript-tslint 'typescript-tsx-mode)

(add-hook 'web-mode-hook  'init-web-mode-hook)
(add-hook 'typescript-mode-hook #'setupinit-tide-mode)


(provide 'javascript)
;;; javascript.el ends here
