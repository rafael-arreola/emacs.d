;;; package --- up-vertico.el

;;; Commentary:

;;; Code:
(use-package vertico
  :straight t
  :init (vertico-mode)
  )
(use-package orderless
  :straight t
  :init (setq completion-styles '(orderless)
              completion-category-defaults nil
              completion-category-overrides '((file (styles partial-completion)))))
 
(provide 'up-vertico)
;;; up-vertico.el ends here
