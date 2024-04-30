(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(connection-local-criteria-alist
   '(((:application tramp :protocol "kubernetes")
      tramp-kubernetes-connection-local-default-profile)
     ((:application tramp :protocol "flatpak")
      tramp-container-connection-local-default-flatpak-profile tramp-flatpak-connection-local-default-profile)
     ((:application tramp)
      tramp-connection-local-default-system-profile tramp-connection-local-default-shell-profile)
     ((:application eshell)
      eshell-connection-default-profile)))
 '(connection-local-profile-alist
   '((tramp-flatpak-connection-local-default-profile
      (tramp-remote-path "/app/bin" tramp-default-remote-path "/bin" "/usr/bin" "/sbin" "/usr/sbin" "/usr/local/bin" "/usr/local/sbin" "/local/bin" "/local/freeware/bin" "/local/gnu/bin" "/usr/freeware/bin" "/usr/pkg/bin" "/usr/contrib/bin" "/opt/bin" "/opt/sbin" "/opt/local/bin"))
     (tramp-kubernetes-connection-local-default-profile
      (tramp-config-check . tramp-kubernetes--current-context-data)
      (tramp-extra-expand-args 97
                               (tramp-kubernetes--container
                                (car tramp-current-connection))
                               104
                               (tramp-kubernetes--pod
                                (car tramp-current-connection))
                               120
                               (tramp-kubernetes--context-namespace
                                (car tramp-current-connection))))
     (tramp-container-connection-local-default-flatpak-profile
      (tramp-remote-path "/app/bin" tramp-default-remote-path "/bin" "/usr/bin" "/sbin" "/usr/sbin" "/usr/local/bin" "/usr/local/sbin" "/local/bin" "/local/freeware/bin" "/local/gnu/bin" "/usr/freeware/bin" "/usr/pkg/bin" "/usr/contrib/bin" "/opt/bin" "/opt/sbin" "/opt/local/bin"))
     (tramp-connection-local-darwin-ps-profile
      (tramp-process-attributes-ps-args "-acxww" "-o" "pid,uid,user,gid,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" "-o" "state=abcde" "-o" "ppid,pgid,sess,tty,tpgid,minflt,majflt,time,pri,nice,vsz,rss,etime,pcpu,pmem,args")
      (tramp-process-attributes-ps-format
       (pid . number)
       (euid . number)
       (user . string)
       (egid . number)
       (comm . 52)
       (state . 5)
       (ppid . number)
       (pgrp . number)
       (sess . number)
       (ttname . string)
       (tpgid . number)
       (minflt . number)
       (majflt . number)
       (time . tramp-ps-time)
       (pri . number)
       (nice . number)
       (vsize . number)
       (rss . number)
       (etime . tramp-ps-time)
       (pcpu . number)
       (pmem . number)
       (args)))
     (tramp-connection-local-busybox-ps-profile
      (tramp-process-attributes-ps-args "-o" "pid,user,group,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" "-o" "stat=abcde" "-o" "ppid,pgid,tty,time,nice,etime,args")
      (tramp-process-attributes-ps-format
       (pid . number)
       (user . string)
       (group . string)
       (comm . 52)
       (state . 5)
       (ppid . number)
       (pgrp . number)
       (ttname . string)
       (time . tramp-ps-time)
       (nice . number)
       (etime . tramp-ps-time)
       (args)))
     (tramp-connection-local-bsd-ps-profile
      (tramp-process-attributes-ps-args "-acxww" "-o" "pid,euid,user,egid,egroup,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" "-o" "state,ppid,pgid,sid,tty,tpgid,minflt,majflt,time,pri,nice,vsz,rss,etimes,pcpu,pmem,args")
      (tramp-process-attributes-ps-format
       (pid . number)
       (euid . number)
       (user . string)
       (egid . number)
       (group . string)
       (comm . 52)
       (state . string)
       (ppid . number)
       (pgrp . number)
       (sess . number)
       (ttname . string)
       (tpgid . number)
       (minflt . number)
       (majflt . number)
       (time . tramp-ps-time)
       (pri . number)
       (nice . number)
       (vsize . number)
       (rss . number)
       (etime . number)
       (pcpu . number)
       (pmem . number)
       (args)))
     (tramp-connection-local-default-shell-profile
      (shell-file-name . "/bin/sh")
      (shell-command-switch . "-c"))
     (tramp-connection-local-default-system-profile
      (path-separator . ":")
      (null-device . "/dev/null"))
     (eshell-connection-default-profile
      (eshell-path-env-list))))
 '(magit-todos-insert-after '(bottom) nil nil "Changed by setter of obsolete option `magit-todos-insert-at'")
 '(org-speed-commands
   '(("Outline Navigation")
     ("n" org-speed-move-safe 'org-next-visible-heading)
     ("p" org-speed-move-safe 'org-previous-visible-heading)
     ("f" org-speed-move-safe 'org-forward-heading-same-level)
     ("b" org-speed-move-safe 'org-backward-heading-same-level)
     ("F" . org-next-block)
     ("B" . org-previous-block)
     ("u" org-speed-move-safe 'outline-up-heading)
     ("g" org-refile
      '(4))
     ("Outline Visibility")
     ("c" . org-cycle)
     ("C" . org-shifttab)
     (" " . org-display-outline-path)
     ("s" . org-toggle-narrow-to-subtree)
     ("=" . org-columns)
     ("Outline Structure Editing")
     ("k" . org-metaup)
     ("j" . org-metadown)
     ("l" . org-metaright)
     ("h" . org-metaleft)
     ("R" . org-shiftmetaright)
     ("L" . org-shiftmetaleft)
     ("i" progn
      (forward-char 1)
      (call-interactively 'org-insert-heading-respect-content))
     ("^" . org-sort)
     ("w" . org-refile)
     ("a" . org-archive-subtree-default-with-confirmation)
     ("@" . org-mark-subtree)
     ("#" . org-toggle-comment)
     ("Clock Commands")
     ("I" . org-clock-in)
     ("O" . org-clock-out)
     ("Meta Data Editing")
     ("t" . org-todo)
     ("," org-priority)
     ("0" org-priority 32)
     ("1" org-priority 65)
     ("2" org-priority 66)
     ("3" org-priority 67)
     (":" . org-set-tags-command)
     ("e" . org-set-effort)
     ("E" . org-inc-effort)
     ("W" lambda
      (m)
      (interactive "sMinutes before warning: ")
      (org-entry-put
       (point)
       "APPT_WARNTIME" m))
     ("Agenda Views etc")
     ("v" . org-agenda)
     ("/" . org-sparse-tree)
     ("Misc")
     ("o" . org-open-at-point)
     ("?" . org-speed-command-help)
     ("<" org-agenda-set-restriction-lock 'subtree)
     (">" org-agenda-remove-restriction-lock)))
 '(package-selected-packages
   '(company-quickhelp cnfonts slime haskell-mode markdown-mode rust-mode doct systemd speed-type tldr popup magit-todos magit eros quickrun meow hl-todo ahk-mode all-the-icons apel auctex avy benchmark-init bison-mode cdlatex clojure-mode-extra-font-locking cmake-mode comment-dwim-2 company consult-dir devdocs doom-modeline dtrt-indent ebnf ebnf-mode electric-operator exec-path-from-shell fish fish-mode flycheck gcmh geiser goto-last-change graphviz-dot-mode groovy-mode helpful info-colors iscroll lox-mode lsp-pyright lua-mode magit-delta module move-text nasm-mode org-appear org-super-agenda ox-reveal pdf-tools posframe prettify-greek prettify-math py-yapf pyim-basedict python-black racket-mode rainbow-delimiters restart-emacs selectic-mode selectric-mode shackle slime-company smart-hungry-delete symbol-overlay try tuareg typescript-mode valign vertico-directory volatile-highlights wakatime-mode which-key yaml-mode yapfify youdao-dictionary))
 '(safe-local-variable-values '((toc-org-max-depth . 3) (checkdoc-minor-mode . t)))
 '(wakatime-api-key "c2a0b2a6-ab7d-4af3-bfbc-0924271ecbb6")
 '(wakatime-cli-path "/usr/bin/wakatime-cli"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(show-paren-match ((t (:background "#1B2229" :foreground "#ffffff" :underline t :weight ultra-bold))))
 '(show-paren-mismatch ((t (:background "purple"))))
 '(symbol-overlay-default-face ((t (:inherit nil :underline "white")))))
