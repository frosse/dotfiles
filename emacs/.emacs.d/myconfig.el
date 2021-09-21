(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(set-fringe-mode 10)

(column-number-mode)
(global-display-line-numbers-mode t)

(setq display-line-numbers-type 'relative)
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook
                vterm-mode-hook))
(add-hook mode (lambda () (display-line-numbers-mode 0))))

(use-package doom-themes
    :init (load-theme 'doom-gruvbox t))
(set-face-attribute 'default nil :font "Cascadia Code" :height 120)

(use-package all-the-icons)

(use-package doom-modeline
:ensure t
:init (doom-modeline-mode 1)
:custom ((doom-modeline-height 15)))

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)	
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

 (use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
         ("C-x b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history)))

(use-package which-key
  :config
    (setq which-key-idle-delay 0.5)
    (setq which-key-popup-type 'frame)
    (which-key-mode)
    (which-key-setup-minibuffer)
    (set-face-attribute 'which-key-local-map-description-face nil
       :weight 'bold)
  :ensure t)

(defun efs/org-mode-setup ()
    (org-indent-mode)
    (visual-line-mode 1))   
    
(use-package org
:hook (org-mode . efs/org-mode-setup)
:config
(setq org-agenda-start-with-log-mode t)
(setq org-log-done 'time)
(setq org-log-into-drawer t)
(setq org-agenda-files
'("~/Notes/org/tasks.org")))

(require 'org-tempo)

(use-package org-bullets
    :after org
    :hook (org-mode . org-bullets-mode)
    :custom
        (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(defun efs/org-mode-visual-fill ()
    (setq visual-fill-column-width 150
        visual-fill-column-center-text t)
    (visual-fill-column-mode 1))

(use-package visual-fill-column
    :hook (org-mode . efs/org-mode-visual-fill))

(org-babel-do-load-languages
'org-babel-load-languages
'((emacs-lisp . t)
  (python . t)))

(use-package evil
  :init
    (setq evil-want-integration t)
    (setq evil-want-keybinding nil)
    (setq evil-want-C-u-scroll t)
  :config
    (evil-mode 1))


(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package key-chord
   :ensure t)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

(use-package docker-tramp)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(use-package term
:config (setq explicit-shell-file-name "bash"))

(use-package vterm
  :commands vterm
  :config
  (setq vterm-max-scrollback 10000))

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  ;; NOTE: Set this to the folder where you keep your Git repos!
  (when (file-directory-p "~/dev/repos")
    (setq projectile-project-search-path '("~/dev/repos")))
  (setq projectile-switch-project-action #'projectile-dired))

(use-package magit
:ensure t)

(use-package dired
:ensure nil
:commands (dired dired-jump)
:bind (("C-x C-j" . dired-jump))
:custom ((dired-listing-switches "-agho --group-directories-first"))
:config
(evil-collection-define-key 'normal 'dired-mode-map
    "h" 'dired-single-up-directory
    "l" 'dired-single-buffer))

(use-package dired-single)

(use-package all-the-icons-dired
:hook (dired-mode . all-the-icons-dired-mode))

(use-package company
:after lsp-mode
:hook (prog-mode . company-mode)
:bind (:map company-active-map
("<tab>" . company-complete-selection))
(:map lsp-mode-map
("<tab>" . company-indent-or-complete-common))
:custom
(company-minimum-prefix-length 1)
(company-idle-delay 0.0))

(use-package lsp-mode 
    :commands (lsp lsp-deferred)
    :hook (lsp-mode . lsp-enable-which-key-integration)
    :init
       (setq lsp-keymap-prefix "C-c l")
    :custom 
     (lsp-rust-analyzer-cargo-watch-command "clippy")
     (lsp-eldoc-render-all t)
     (lsp-idle-delay 0.6)
     (lsp-rust-analyzer-server-display-inlay-hints t)
    :config 
    (setq lsp-completion-enable-additional-text-edit nil)
    (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(use-package lsp-ui)
(use-package lsp-treemacs)
(use-package lsp-ivy)

(use-package dap-mode :after lsp-mode :config (dap-auto-configure-mode))
;; Thanks reddit 
;; Add color formatting to *compilation* buffer
(add-hook 'compilation-filter-hook
(lambda () (ansi-color-apply-on-region (point-min) (point-max))))

:init
    (setq lsp-java-vmargs (list "-javaagent:/home/frosse/.m2/repository/org/projectlombok/lombok/1.18.16/lombok-1.18.16.jar"
     ))
(use-package lsp-java 
    :config (add-hook 'java-mode-hook 'lsp))
    (setq lsp-java-format-settings-url "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml")
    (setq lsp-java-format-settings-profile "GoogleStyle")
    (add-hook 'java-mode-hook (defun my-set-java-tab-width () (setq tab-width 2)))  
(use-package dap-java :ensure nil)
(require 'lsp-java-boot)

;; to enable the lenses
(add-hook 'lsp-mode-hook #'lsp-lens-mode)
(add-hook 'java-mode-hook #'lsp-java-boot-lens-mode)

(use-package rustic
  :ensure
  :bind (:map rustic-mode-map
              ("M-j" . lsp-ui-imenu)
              ("M-?" . lsp-find-references)
              ("C-c C-c l" . flycheck-list-errors)
              ("C-c C-c a" . lsp-execute-code-action)
              ("C-c C-c r" . lsp-rename)
              ("C-c C-c q" . lsp-workspace-restart)
              ("C-c C-c Q" . lsp-workspace-shutdown)
              ("C-c C-c s" . lsp-rust-analyzer-status))
  :config
  ;; uncomment for less flashiness
   (setq lsp-eldoc-hook nil)
   (setq lsp-enable-symbol-highlighting nil)
   (setq lsp-signature-auto-activate nil)

  ;; comment to disable rustfmt on save
  (setq rustic-format-on-save t)
  (add-hook 'rustic-mode-hook 'rk/rustic-mode-hook))

(defun rk/rustic-mode-hook ()
  ;; so that run C-c C-c C-r works without having to confirm, but don't try to
  ;; save rust buffers that are not file visiting. Once
  ;; https://github.com/brotzeit/rustic/issues/253 has been resolved this should
  ;; no longer be necessary.
  (when buffer-file-name
    (setq-local buffer-save-without-query t)))

(use-package flycheck)
(defun setup-tide-mode ()
 (interactive)
 (tide-setup)
 (flycheck-mode +1)
 (setq flycheck-check-syntax-automatically '(save mode-enabled))
 (eldoc-mode +1))
(setq company-tooltip-align-annotations t)
(add-hook 'typescript-mode-hook #'setup-tide-mode)

(use-package yasnippet :config (yas-global-mode))

(use-package general
  :config
  (general-create-definer leader-keys
    :keymaps '(normal visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")

  (leader-keys
    "a"  'org-agenda
    "s" 'shell
    "f" 'counsel-find-file))
