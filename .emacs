;; Customization file
(setq custom-file "~/.emacs.custom.el")
(load custom-file)

;; Line Endings
(setq default-buffer-file-coding-system 'utf-8-unix)

;; Window
(tool-bar-mode 0)
(scroll-bar-mode 0)

(show-paren-mode 1)

;; Line Numbers
(column-number-mode 1)
(global-display-line-numbers-mode 1)

;; No backup files
(setq make-backup-files nil)
(auto-save-mode -1)

;; Themes
(add-to-list 'custom-theme-load-path "~/.emacs.local/themes")
(setq catppuccin-flavor 'mocha)
(load-theme 'catppuccin t)
