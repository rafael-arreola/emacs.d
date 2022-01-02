(use-package projectile
  :straight t
  :init (projectile-mode +1)
  :bind (:map projectile-mode-map
              ("C-p" . projectile-find-file)
              ("C-c p" . projectile-command-map))
  :config (setq projectile-completion-system 'default)
  )

(provide 'up-projectile)
