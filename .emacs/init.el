;;
;; emacs settings.
;;

;;
;; window appearances.
;;
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode -1)

;;
;; auto-saving, backups.
;;
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq next-line-add-newlines nil)

;;
;; key bindings.
;;
(global-set-key "\C-h" 'delete-backward-char)

;;
;; package lists.
;;
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/") t)
(package-initialize)

;;
;; themes.
;;
(load-theme 'monokai t)

;;
;; fonts.
;;
;; (add-to-list 'default-frame-alist '(font . "Bitstream Vera Sans Mono 8"))
(set-default-font "Bitstream Vera Sans Mono 9")

;;
;; auto-complete
;;
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)

;;
;; w3m
;;
(require 'w3m)
(defun w3m-browse-url-other-window (url &optional newwin)
  (let ((w3m-pop-up-windows t))
    (if (one-window-p) (split-window))
    (other-window 1)
    (w3m-browse-url url newwin)))

;;
;; markdown-mode
;;
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(defun markdown-render-w3m (n)
  (interactive "p")
  (message (buffer-file-name))
  (call-process "/usr/local/bin/grip" nil nil nil
		"--export"
		(buffer-file-name)
		"/tmp/grip.html")
  (w3m-browse-url-other-window "file://tmp/grip.html"))

(define-key markdown-mode-map "\C-c\C-p" 'markdown-render-w3m)
