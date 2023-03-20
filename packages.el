;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;(package! some-package)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/raxod502/straight.el#the-recipe-format
;(package! another-package
;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;(package! this-package
;  :recipe (:host github :repo "username/repo"
;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;(package! builtin-package :recipe (:nonrecursive t))
;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see raxod502/straight.el#279)
;(package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
;(package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;(unpin! pinned-package)
;; ...or multiple packages
;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;(unpin! t)
(package! org-ref)
(package! aio)
(package! org-appear)
(package! company-math)
(package! magic-latex-buffer)
(package! mixed-pitch)
(package! org-sticky-header)
(package! auctex)
(package! org-superstar)
;;(package! texfrag)
(package! unicode-fonts
  :recipe (:host github :repo "rolandwalker/unicode-fonts"))
(package! company-prescient)
(package! svg-clock)
(package! proof-general)
(package! valign)
(package! svg-lib
  :recipe (:host github :repo "rougier/svg-lib"))
(package! nano-theme
  :recipe (:host github :repo "rougier/nano-theme"))
(package! rime)
(package! ivy-bibtex)
(package! with-editor)
(package! ghub)
;; (package! tintin-mode
;;   :recipe (:host github :repo "matthewrsilver/tintin-mode"))
;; (package! outshine)
(package! navi)
;; (package! org-modern
;;   :recipe (:host github :repo "minad/org-modern"))
;; (package! leetcode)
;; (package! shrface)
(package! riscv-mode)
(package! git-timemachine)
;; (package! realgud-lldb)
(package! xterm-color)
(package! google-c-style)
;; (package! ssh-deploy)
(package! exec-path-from-shell)
(package! vterm)
(package! dirvish)
(package! flycheck-grammarly)
(package! dante)
(package! wakatime-mode)
;; (package! vdiff)
;; (package! vdiff-magit)
(package! magit-delta)
(package! auto-save
  :recipe (:host github :repo "manateelazycat/auto-save"))
;; (package! bison
;;   :recipe (:host github :repo "manateelazycat/bison"))
(package! lsp-pyright)
(package! transient
      :pin "c2bdf7e12c530eb85476d3aef317eb2941ab9440"
      :recipe (:host github :repo "magit/transient"))

(package! with-editor
          :pin "bbc60f68ac190f02da8a100b6fb67cf1c27c53ab"
          :recipe (:host github :repo "magit/with-editor"))

(package! iscroll)
