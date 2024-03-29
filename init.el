(require 'package)

(setq package-archives
      '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
        ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
	    ;; ("org"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
        ))
(package-initialize)
(require 'use-package)
(setq use-package-always-ensure t
      use-package-always-demand t)

(defun package--print-email-button (a))

;; (setq debug-on-error nil)
;; (setq debug-on-error t)

;; Adjust garbage collection thresholds during startup, and thereafter
(let ((init-gc-cons-threshold most-positive-fixnum))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'emacs-startup-hook
            (lambda () (setq gc-cons-threshold (* 20 1024 1024)))))

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)
(delete-selection-mode 1)
(set-default-coding-systems 'utf-8)

(org-babel-load-file "~/.emacs.d/config.org")
