(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq comp-deferred-compilation t)
(setq vc-follow-symlinks t)

(straight-use-package 'use-package)
(eval-when-compile
  (require 'use-package))

(use-package auto-package-update
  :straight t
  :custom
  (auto-package-update-delete-old-versions t)
  (auto-package-update-hide-results t)
  :config
  (auto-package-update-maybe))

(use-package exec-path-from-shell
  :straight t
  :custom (exec-path-from-shell-arguments '("-l"))
  :init 
  (when (daemonp)
    (exec-path-from-shell-initialize))
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(add-to-list 'load-path "~/.emacs.d/lisp/")
(straight-use-package '(org :type built-in))
(org-babel-load-file (expand-file-name "config.org" user-emacs-directory))

(setq custom-file "~/.emacs.d/var/custom.el")
(load custom-file)

