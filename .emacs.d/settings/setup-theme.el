(require 'helm-custom-themes)

(defvar custom-default-font "Liberation Mono 13")

(defvar dark-client-theme 'deeper-blue)
(defvar dark-theme 'tango-dark)
(defvar light-client-theme 'adwaita)
(defvar light-theme 'flatui)

(defun set-custom-font (custom-font)
  (add-to-list 'default-frame-alist (cons 'font custom-font))
  (set-default-font custom-font))

(defun go-to-dark ()
  "setup light-on-dark colors"
  (interactive)
  (disable-theme light-theme)
  (disable-theme light-client-theme)
  (set-face-foreground 'highlight nil)
  (set-face-background 'hl-line "black")
  (if (daemonp)
      (load-theme dark-client-theme)
    (if window-system (load-theme dark-theme)))
  (sml/apply-theme "dark")
  (helm-apply-dark-theme))

(defun go-to-light ()
  "setup dark-on-light colors"
  (interactive)
  (disable-theme dark-theme)
  (disable-theme dark-client-theme)
  (set-face-foreground 'highlight nil)
  (set-face-background 'hl-line "gainsboro")
  (if (daemonp)
      (load-theme light-client-theme)
    (if window-system (load-theme light-theme)))
  (sml/apply-theme "light")
  (helm-apply-light-theme))

(defun go-to-terminal ()
  "setup colors for white-on-black terminal"
  (interactive)
  (disable-theme dark-theme)
  (disable-theme dark-client-theme)
  (disable-theme light-theme)
  (disable-theme light-client-theme)
  (set-face-foreground 'highlight nil)
  (sml/apply-theme "respectful")
  (global-set-key (kbd "C-h") 'delete-backward-char)
  (helm-apply-terminal-theme))

(set-custom-font custom-default-font)
(go-to-dark)

(provide 'setup-theme)
