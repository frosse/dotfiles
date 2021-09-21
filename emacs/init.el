(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package org)
(setq inhibit-splash-screen t)
;; Nuke Emacs keybinds

(use-package evil
  :init
    (setq evil-want-keybinding nil)
    (setq evil-want-C-u-scroll t)
  :config
    (evil-mode 1))
;; Can't use Esc-key always, almost never...
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package key-chord
   :ensure t)

(key-chord-mode 1)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

(define-key evil-normal-state-map (kbd "C-n") 'evil-next-buffer)
(define-key evil-normal-state-map (kbd "C-p") 'evil-prev-buffer)

;; ANSI-TERM
(defvar my-term-shell "/bin/bash")
(defadvice ansi-term (before force-bash)
  (interactive (list my-term-shell)))

(ad-activate 'ansi-term)
(global-visual-line-mode 1)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
;; Make UI disapear
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(set-fringe-mode 10)

;; Know where you are
(column-number-mode)

(global-display-line-numbers-mode t)
(setq make-backup-file nil)
(setq auto-save-default nil)
(setq display-line-numbers-type 'relative)

(use-package undo-tree)
(global-undo-tree-mode)
(evil-set-undo-system 'undo-tree)


(setq electric-pair-pairs '(
			    (?\( .?\))
			    (?\[ .?\])
			    (?\{ .?\})))
(electric-pair-mode t)
(use-package which-key
  :config
    (setq which-key-idle-delay 0.5)
    (setq which-key-popup-type 'frame)
    (which-key-mode)
    (which-key-setup-minibuffer)
    (set-face-attribute 'which-key-local-map-description-face nil
       :weight 'bold))

(set-face-attribute 'default nil :font "Cascadia Code" :height 120)

(use-package mood-line
  :init (mood-line-mode 1))

(use-package lsp-mode 
   :commands (lsp)
    :init
	(setq lsp-keymap-prefix "C-c l"))

(use-package typescript-mode
    :mode "\\.ts\\'"
    :config
    (setq typescript-indent-level 2))

(use-package company
    :after lsp-mode
    :hook (lsp-mode . company-mode)
    :bind (:map company-active-map
	("<tab>" . company-complete-selection)
        ("C-j" . company-select-next)
        ("C-k" . company-select-previous))
	(:map lsp-mode-map
	("<tab>" . company-indent-or-complete-common))
    :custom
    (company-minimum-prefix-length 1)
    (company-idle-delay 0.0))

(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode))

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  ;; NOTE: Set this to the folder where you keep your Git repos!
  (when (file-directory-p "~/dev")
    (setq projectile-project-search-path '("~/dev")))
  (setq projectile-switch-project-action #'projectile-dired))

(use-package vertico
  :bind (:map vertico-map
	      ("C-j" . vertico-next)
	      ("C-k" . vertico-previous))
  :custom
  (vertico-cycle t)
  :init (vertico-mode))

(use-package savehist
  :init
  (savehist-mode))

(use-package orderless
  :init
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((file (styles . (partial-completion))))))


(use-package prettier
  :init
  (global-prettier-mode 1))
;;(add-hook 'after-init-hook #'global-prettier-mode)
(setq prettier-enabled-parsers '(babel babel-ts html typescript))

(use-package general
  :config
  (general-create-definer leader-keys
    :keymaps '(normal visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")

  (leader-keys
    "a"  'org-agenda
    "r s" 'eshell
    "f" 'find-file
    "b" 'switch-to-buffer
    )

  (leader-keys
    :keymaps 'eww-mode-map
    "h" 'eww-back-url)
  )

(use-package gruvbox-theme
    :init (load-theme 'gruvbox t))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(gruvbox-theme general prettier orderless vertico projectile lsp-ui company-box company typescript-mode which-key use-package undo-tree mood-line key-chord evil-collection)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
