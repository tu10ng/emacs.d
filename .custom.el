(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(connection-local-criteria-alist
   '(((:application tramp :protocol "kubernetes")
      tramp-kubernetes-connection-local-default-profile)
     ((:application tramp :protocol "flatpak")
      tramp-container-connection-local-default-flatpak-profile
      tramp-flatpak-connection-local-default-profile)
     ((:application tramp)
      tramp-connection-local-default-system-profile
      tramp-connection-local-default-shell-profile)
     ((:application eshell) eshell-connection-default-profile)))
 '(connection-local-profile-alist
   '((tramp-flatpak-connection-local-default-profile
      (tramp-remote-path "/app/bin" tramp-default-remote-path "/bin"
                         "/usr/bin" "/sbin" "/usr/sbin"
                         "/usr/local/bin" "/usr/local/sbin"
                         "/local/bin" "/local/freeware/bin"
                         "/local/gnu/bin" "/usr/freeware/bin"
                         "/usr/pkg/bin" "/usr/contrib/bin" "/opt/bin"
                         "/opt/sbin" "/opt/local/bin"))
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
      (tramp-remote-path "/app/bin" tramp-default-remote-path "/bin"
                         "/usr/bin" "/sbin" "/usr/sbin"
                         "/usr/local/bin" "/usr/local/sbin"
                         "/local/bin" "/local/freeware/bin"
                         "/local/gnu/bin" "/usr/freeware/bin"
                         "/usr/pkg/bin" "/usr/contrib/bin" "/opt/bin"
                         "/opt/sbin" "/opt/local/bin"))
     (tramp-connection-local-darwin-ps-profile
      (tramp-process-attributes-ps-args "-acxww" "-o"
                                        "pid,uid,user,gid,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                        "-o" "state=abcde" "-o"
                                        "ppid,pgid,sess,tty,tpgid,minflt,majflt,time,pri,nice,vsz,rss,etime,pcpu,pmem,args")
      (tramp-process-attributes-ps-format (pid . number)
                                          (euid . number)
                                          (user . string)
                                          (egid . number) (comm . 52)
                                          (state . 5) (ppid . number)
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
                                          (pmem . number) (args)))
     (tramp-connection-local-busybox-ps-profile
      (tramp-process-attributes-ps-args "-o"
                                        "pid,user,group,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                        "-o" "stat=abcde" "-o"
                                        "ppid,pgid,tty,time,nice,etime,args")
      (tramp-process-attributes-ps-format (pid . number)
                                          (user . string)
                                          (group . string) (comm . 52)
                                          (state . 5) (ppid . number)
                                          (pgrp . number)
                                          (ttname . string)
                                          (time . tramp-ps-time)
                                          (nice . number)
                                          (etime . tramp-ps-time)
                                          (args)))
     (tramp-connection-local-bsd-ps-profile
      (tramp-process-attributes-ps-args "-acxww" "-o"
                                        "pid,euid,user,egid,egroup,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                        "-o"
                                        "state,ppid,pgid,sid,tty,tpgid,minflt,majflt,time,pri,nice,vsz,rss,etimes,pcpu,pmem,args")
      (tramp-process-attributes-ps-format (pid . number)
                                          (euid . number)
                                          (user . string)
                                          (egid . number)
                                          (group . string) (comm . 52)
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
                                          (pmem . number) (args)))
     (tramp-connection-local-default-shell-profile
      (shell-file-name . "/bin/sh") (shell-command-switch . "-c"))
     (tramp-connection-local-default-system-profile
      (path-separator . ":") (null-device . "/dev/null"))
     (eshell-connection-default-profile (eshell-path-env-list))))
 '(magit-todos-insert-after '(bottom) nil nil "Changed by setter of obsolete option `magit-todos-insert-at'")
 '(org-speed-commands
   '(("Outline Navigation")
     ("n" org-speed-move-safe 'org-next-visible-heading)
     ("p" org-speed-move-safe 'org-previous-visible-heading)
     ("f" org-speed-move-safe 'org-forward-heading-same-level)
     ("b" org-speed-move-safe 'org-backward-heading-same-level)
     ("F" . org-next-block) ("B" . org-previous-block)
     ("u" org-speed-move-safe 'outline-up-heading)
     ("g" org-refile '(4)) ("Outline Visibility") ("c" . org-cycle)
     ("C" . org-shifttab) (" " . org-display-outline-path)
     ("s" . org-toggle-narrow-to-subtree) ("=" . org-columns)
     ("Outline Structure Editing") ("k" . org-metaup)
     ("j" . org-metadown) ("l" . org-metaright) ("h" . org-metaleft)
     ("R" . org-shiftmetaright) ("L" . org-shiftmetaleft)
     ("i" progn (forward-char 1)
      (call-interactively 'org-insert-heading-respect-content))
     ("^" . org-sort) ("w" . org-refile)
     ("a" . org-archive-subtree-default-with-confirmation)
     ("@" . org-mark-subtree) ("#" . org-toggle-comment)
     ("Clock Commands") ("I" . org-clock-in) ("O" . org-clock-out)
     ("Meta Data Editing") ("t" . org-todo) ("," org-priority)
     ("0" org-priority 32) ("1" org-priority 65) ("2" org-priority 66)
     ("3" org-priority 67) (":" . org-set-tags-command)
     ("e" . org-set-effort) ("E" . org-inc-effort)
     ("W" lambda (m) (interactive "sMinutes before warning: ")
      (org-entry-put (point) "APPT_WARNTIME" m))
     ("Agenda Views etc") ("v" . org-agenda) ("/" . org-sparse-tree)
     ("Misc") ("o" . org-open-at-point) ("?" . org-speed-command-help)
     ("<" org-agenda-set-restriction-lock 'subtree)
     (">" org-agenda-remove-restriction-lock)))
 '(package-selected-packages
   '(ahk-mode all-the-icons apel auctex avy benchmark-init bison-mode
              casual-calc cdlatex clojure-mode-extra-font-locking
              cmake-mode cnfonts comment-dwim-2 company
              company-quickhelp consult-dir devdocs dired diredfl doct
              dogears doom-modeline dtrt-indent ebnf ebnf-mode
              electric-operator eros exec-path-from-shell fish
              fish-mode flycheck form-feed-st fussy gcmh geiser
              goto-last-change graphviz-dot-mode groovy-mode
              haskell-mode helpful hl-todo htmlize info-colors iscroll
              json-mode lox-mode lsp-pyright lua-mode magit
              magit-delta magit-todos markdown-mode meow module
              move-text nasm-mode org-appear org-super-agenda ox-gfm
              ox-reveal page-break-lines pdf-tools popup posframe
              powershell prettify-greek prettify-math py-yapf
              pyim-basedict python-black quickrun racket-mode
              rainbow-delimiters rainbow-mode restart-emacs ripgrep
              rust-mode selectic-mode selectric-mode shackle shx
              sideline slime slime-company smart-hungry-delete
              speed-type symbol-overlay systemd tldr try tuareg
              typescript-mode valign vertico-directory visible-mark
              volatile-highlights wakatime-mode which-key yaml-mode
              yapfify youdao-dictionary))
 '(safe-local-variable-values '((toc-org-max-depth . 3) (checkdoc-minor-mode . t)))
 '(wakatime-cli-path "C:\\Users\\incubator\\scoop\\shims\\wakatime-cli.EXE"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(show-paren-match ((t (:background "#1B2229" :foreground "#ffffff" :underline t :weight ultra-bold))))
 '(show-paren-mismatch ((t (:background "purple"))))
 '(symbol-overlay-default-face ((t (:inherit nil :underline "white")))))
