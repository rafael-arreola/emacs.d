;;; up-company.el -*- lexical-binding: t; -*-
(use-package company
  :straight t
  :init (global-company-mode)
  :bind (("C-SPC" . company-complete))
  )
(provide 'up-company)
