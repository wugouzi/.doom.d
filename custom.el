(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(connection-local-criteria-alist
   '(((:application tramp :machine "localhost")
      tramp-connection-local-darwin-ps-profile)
     ((:application tramp :machine "wudeMacBook-Pro.local")
      tramp-connection-local-darwin-ps-profile)
     ((:application tramp)
      tramp-connection-local-default-system-profile tramp-connection-local-default-shell-profile)))
 '(connection-local-profile-alist
   '((tramp-connection-local-darwin-ps-profile
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
      (null-device . "/dev/null"))))
 '(custom-safe-themes
   '("835868dcd17131ba8b9619d14c67c127aa18b90a82438c8613586331129dda63" "1d5e33500bc9548f800f9e248b57d1b2a9ecde79cb40c0b1398dec51ee820daf" "76ed126dd3c3b653601ec8447f28d8e71a59be07d010cd96c55794c3008df4d7" "ab058aa22bdaf17b5d8a9e21632a62c8966728ae10ef8fd07e95637e9cdf7a7b" "f0eb51d80f73b247eb03ab216f94e9f86177863fb7e48b44aacaddbfe3357cf1" default))
 '(mouse-wheel-progressive-speed nil)
 '(org-agenda-files
   '("/Users/wu/Library/CloudStorage/OneDrive-zju.edu.cn/courses/论文/中期/paper/paper.org" "/Users/wu/Library/CloudStorage/OneDrive-zju.edu.cn/courses/论文/开题/展示/pre.org" "/Users/wu/notes/course/Computability/report.org"))
 '(package-selected-packages '(ghub with-editor))
 '(wakatime-api-key "f0aa71f3-a6c6-48b0-a591-b53c893a5fec")
 '(wakatime-cli-path "/Users/wu/.wakatime/wakatime-cli")
 '(warning-suppress-log-types
   '(((undo discard-info))
     ((flycheck syntax-checker))
     ((flycheck syntax-checker))))
 '(warning-suppress-types '(((flycheck syntax-checker)) ((flycheck syntax-checker)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-block ((t (:background "#fff7fb"))))
 '(org-block-begin-line ((t (:underline "#A7A6AA" :foreground "#008ED1" :background "#f7f2f5"))))
 '(org-block-end-line ((t (:overline "#A7A6AA" :foreground "#008ED1" :background "#f7f2f5"))))
 '(org-document-title ((t (:bold t :foreground "#a626a4" :weight bold :height 2.0))))
 '(org-level-1 ((t (:bold t :weight bold :foreground "#e45649" :height 1.75))))
 '(org-level-2 ((t (:bold t :weight bold :foreground "#da8548" :height 1.5))))
 '(org-level-3 ((t (:bold t :weight bold :foreground "#b751b6" :height 1.25))))
 '(org-level-4 ((t (:bold t :weight bold :foreground "#6f99f5" :height 1.1))))
 '(org-level-5 ((t (:bold t :weight bold :foreground "#bc5cba"))))
 '(org-level-6 ((t (:bold t :weight bold :foreground "#9fbbf8"))))
 '(org-level-7 ((t (:bold t :weight bold :foreground "#d292d1"))))
 '(org-level-8 ((t (:bold t :weight bold :foreground "#d8e4fc"))))
 '(variable-pitch ((t (:family "Source Han Serif SC" :height 120)))))
(put 'customize-group 'disabled nil)
