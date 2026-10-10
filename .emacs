;; [Configurations]
; Customization file
(setq custom-file "~/.emacs.custom.el")
(load custom-file)

; Auto-update configuration
(global-auto-revert-mode -1)

;; [Editor]
; Window
(tool-bar-mode 0)
(scroll-bar-mode 0)
(show-paren-mode 1)

; Line Endings
(setq-default buffer-file-coding-system 'utf-8-unix)
(setq-default coding-system-for-write 'utf-8-unix)

; Line Numbers
(column-number-mode 1)
(global-display-line-numbers-mode 1)

; Tabs
(setq-default indent-tabs-mode nil)
(electric-indent-mode -1)
(setq tab-always-indent 'complete)

;; [Files]
; Backup files
(setq make-backup-files nil)
(auto-save-mode -1)

; Autosave files
(setq auto-save-default nil)
(setq create-lockfiles nil)

;; [Modes]
(add-to-list 'load-path "~/.emacs.local/modes")
(require 'lua-mode)

;; [Themes]
(add-to-list 'custom-theme-load-path "~/.emacs.local/themes")
(add-to-list 'load-path "~/.emacs.local/themes")
(add-to-list 'load-path "~/.emacs.local/themes/catppuccin")
(add-to-list 'load-path "~/.emacs.local/themes/kanagawa")
(add-to-list 'load-path "~/.emacs.local/themes/doom")

; Kanagawa
(require 'kanagawa-themes)
(load-theme 'kanagawa-wave t)

; catppuccin
; (require 'catppuccin-theme)
; (setq catppuccin-flavor 'latte)
; (load-theme 'catppuccin t)

; Doom
; (require 'doom-themes)
; (load-theme 'doom-outrun-electric t)

;; [Packages]
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(use-package corfu
  :ensure t
  :custom (corfu-auto t)
          (corfu-auto-delay 0.2)
          (corfu-auto-prefix 2)
  :init (global-corfu-mode))


(use-package lsp-mode
  :ensure t
  :hook (c-mode . lsp-deferred)
        (c++-mode . lsp-deferred)
        (python-mode .lsp-deferred)
  :custom (lsp-completion-mode :capf))
