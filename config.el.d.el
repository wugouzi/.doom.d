;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "wu"
      user-mail-address "f_dogs@protonmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "DejaVu Sans Mono" :size 13)
      ;;doom-variable-pitch-font (font-spec :family "Source Han Serif SC" :size 1)
      doom-variable-pitch-font (font-spec :family "Merriweather" :size 1)
      )
(setq doom-unicode-font (font-spec :family "DejaVu Sans Mono"))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one-light)
;; (setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;;(use-package ivy
;;  :bind (("C-s" . swiper)
;;         ("C-x b" . ivy-switch-buffer)
;;         :map org-mode-map
;;         ("M-." . counsel-org-goto)
;;         ("C-u C-SPC" . org-mark-ring-goto)))

;; (use-package vertico-mode
;;   :bind (("C-s" . vertico)))


(use-package smartparens
  :ensure t
  :bind (("M-k" . sp-backward-kill-sexp))
  :hook (org-mode . smartparens-mode)
  :config
  (require 'smartparens-config)

  (sp-local-pair 'LaTeX-mode "$" "$")
  (sp-local-pair 'org-mode "$" "$")
  (sp-local-pair 'org-mode "{" "}")
  (sp-local-pair 'org-mode "(" ")")
  (sp-local-pair 'org-mode "（" "）")
  ;;(sp-local-pair 'org-mode "\(" nil :actions :rem)
  (sp-local-pair 'org-mode "_" nil :actions :rem)
  (sp-local-pair 'org-mode "/" nil :actions :rem)
  (sp-local-pair 'org-mode "~" nil :actions :rem)
  (sp-local-pair 'org-mode "*" nil :actions :rem)
  (sp-local-pair 'org-mode "=" nil :actions :rem)
  (sp-local-pair 'org-mode "'" nil :actions :rem)
  (sp-local-pair 'org-mode "\\left(" "\\right)" :trigger "\\l(" :post-handlers '(sp-latex-insert-spaces-inside-pair))
  (sp-local-pair 'org-mode "\\left[" "\\right]" :trigger "\\l[" :post-handlers '(sp-latex-insert-spaces-inside-pair))
  (sp-local-pair 'org-mode "\\left\\{" "\\right\\}" :trigger "\\l{" :post-handlers '(sp-latex-insert-spaces-inside-pair))
  (sp-local-pair 'org-mode "\\left|" "\\right|" :trigger "\\l|" :post-handlers '(sp-latex-insert-spaces-inside-pair))
  )

(custom-theme-set-faces
 'user
 `(org-level-1 ((t (:bold t :weight bold :foreground "#e45649" :height 1.75))))
 `(org-level-2 ((t (:bold t :weight bold :foreground "#da8548" :height 1.5))))
 `(org-level-3 ((t (:bold t :weight bold :foreground "#b751b6" :height 1.25))))
 `(org-level-4 ((t (:bold t :weight bold :foreground "#6f99f5" :height 1.1))))
 `(org-level-5 ((t (:bold t :weight bold :foreground "#bc5cba"))))
 `(org-level-6 ((t (:bold t :weight bold :foreground "#9fbbf8"))))
 `(org-level-7 ((t (:bold t :weight bold :foreground "#d292d1"))))
 `(org-level-8 ((t (:bold t :weight bold :foreground "#d8e4fc"))))
 `(org-document-title ((t (:bold t :foreground "#a626a4" :weight bold :height 2.0))))
 '(org-block-begin-line
   ((t (:underline "#A7A6AA" :foreground "#008ED1" :background "#f7f2f5" ))))
 '(org-block
   ((t (:background "#fff7fb"))))
 '(org-block-end-line
   ((t (:overline "#A7A6AA" :foreground "#008ED1" :background "#f7f2f5"))))
 '(variable-pitch ((t (:family "Source Han Serif SC" :height 120))))
 ;;'(fixed-pitch ((t ( :family "iA Writer Mono S" :height 111))))
 ;;'(fixed-pitch ((t ( :family "Ios" :height 111))))
 )

;; ;; Make verbatim with highlight text background.
;; (add-to-list 'org-emphasis-alist
;;            '("=" (:background "#fef7ca")))
;; ;; Make deletion(obsolote) text foreground with dark gray.
;; (add-to-list 'org-emphasis-alist
;;            '("+" (:foreground "dark gray"
;;                   :strike-through t)))
;; ;; Make code style around with box.
;; (add-to-list 'org-emphasis-alist
;;            '("~" (:box (:line-width 1
;;                         :color "grey75"
;;                         :style released-button))))

(use-package auctex
  :init
  (setq preview-auto-cache-preamble t
        preview-default-preamble
        (quote
         ("\\RequirePackage["
          ("," . preview-default-option-list)
          "]{preview}[2004/11/05]"
          "\\PreviewEnvironment{tikzcd}"
          "\\PreviewEnvironment{tikzpicture}"
          "\\PreviewEnvironment{center}"
          "\\PreviewEnvironment{algorithmic}"
          "\\PreviewEnvironment{itemize}"
          "\\PreviewEnvironment{figure}"))
        preview-dvipng-image-type (quote png)
        TeX-command-extra-options "-shell-escape"
        TeX-engine 'xetex
        ;;'(Evince)
        +latex-viewers '(skim)
        preview-transparent-color nil)

  :hook
  (
   (LaTeX-mode . turn-on-reftex)
   (plain-TeX-mode . LaTeX-mode)

   )
  :config
  (use-package magic-latex-buffer
    :init
    (setq magic-latex-enable-block-highlight t
          magic-latex-enable-suscript        t
          magic-latex-enable-pretty-symbols  t
          magic-latex-enable-block-align     nil
          magic-latex-enable-inline-image    t
          magic-latex-enable-minibuffer-echo nil)
    :hook
    ((LaTeX-mode . magic-latex-buffer)))
  )

(defun org-export-ignore-headlines (data backend info)
  "Remove headlines tagged \"ignore\" retaining contents and promoting children.
Each headline tagged \"ignore\" will be removed retaining its
contents and promoting any children headlines to the level of the
parent."
  (org-element-map data 'headline
    (lambda (object)
      (when (member "ignore" (org-element-property :tags object))
        (let ((level-top (org-element-property :level object))
              level-diff)
          (mapc (lambda (el)
                  ;; recursively promote all nested headlines
                  (org-element-map el 'headline
                    (lambda (el)
                      (when (equal 'headline (org-element-type el))
                        (unless level-diff
                          (setq level-diff (- (org-element-property :level el)
                                              level-top)))
                        (org-element-put-property el
                                                  :level (- (org-element-property :level el)
                                                            level-diff)))))
                  ;; insert back into parse tree
                  (org-element-insert-before el object))
                (org-element-contents object)))
        (org-element-extract-element object)))
    info nil)
  data)

(add-hook 'org-export-filter-parse-tree-functions 'org-export-ignore-headlines)
(setq org-element-use-cache nil)
(add-hook 'org-mode-hook #'(lambda () (setq fill-column 100)))
(add-hook 'org-mode-hook 'auto-fill-mode)
(add-hook 'org-mode-hook 'iscroll-mode)
(add-hook 'org-mode-hook 'mixal-mode)
(setq org-startup-indented nil)
;;(add-hook 'org-mode-hook 'valign-mode)
(setq org-highlight-latex-and-related '(native script entities))
;;very bad perfomance
(setq org-highlight-latex-and-related '(entities))
;;(setq org-highlight-latex-and-related '(native))
;;(setq org-highlight-latex-and-related '(latex))
;;(setq org-highlight-latex-and-related '(latex script entities))
(require 'org-indent)
(org-indent-mode -1)
(setq org-hide-emphasis-markers t)
(setq org-startup-indented nil)
(setq org-latex-listings 'minted
      ;;org-latex-packages-alist '(("" "minted"))
      )
(setq org-latex-pdf-process
      (quote
       ("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f" "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
      )
(setq org-preview-latex-default-process 'imagemagick)
(setq org-emphasis-alist
      '(("*" bold)
        ("/" italic)
        ("_" underline)
        ("=" org-verbatim verbatim)
        ("~" org-code verbatim)
        ;; ("+" (:strike-through t))
        ))
(setq org-appear-autolinks t)
(setq preview-scale-function 2.0)
;; (defun my-latex-mode-setup ()
;;   (setq-local company-backends
;;               ;;              (append '((company-dabbrev company-math-symbols-latex company-latex-commands))
;;               ;;                      company-backends)))
;;               '((company-dabbrev company-math-symbols-latex company-latex-commands))))

;; (add-hook 'org-mode-hook 'my-latex-mode-setup)


(setq company-dabbrev-minimum-length 5)
(setq company-dabbrev-char-regexp "[A-Za-z]+")
(setq company-idle-delay 0)
(set-company-backend! 'org-mode 'company-dabbrev 'company-yasnippet 'company-math-symbols-latex 'company-latex-commands)

;; (use-package company
;;   :bind (("M-/" . company-complete)
;;          ("C-M-i" . company-complete)
;;          :map company-mode-map
;;          ("<backtab>" . company-yasnippet)
;;          :map company-active-map
;;          ("C-p" . company-select-previous)
;;          ("C-n" . company-select-next)
;;          ("<tab>" . company-complete-common-or-cycle)
;;          ("<backtab>" . my-company-yasnippet)
;;          :map company-search-map
;;          ("C-p" . company-select-previous)
;;          ("C-n" . company-select-next))
;;   :init
;;   (setq company-tooltip-align-annotations t
;;         company-tooltip-limit 12
;;         company-idle-delay 0
;;         company-echo-delay (if (display-graphic-p) nil 0)
;;         company-minimum-prefix-length 1
;;         company-require-match nil
;;         company-dabbrev-ignore-case nil
;;         company-dabbrev-downcase nil
;;         company-dabbrev-minimum-length 5
;;         company-dabbrev-char-regexp "[A-Za-z]+")
;;   :config
;;   (set-company-backend! 'org-mode 'company-dabbrev 'company-math-symbols-latex 'company-latex-commands)
;;   )

;; ;;(setq company-dabbrev-ignore-case nil)
;; ;;(setq company-dabbrev-downcase nil)


;; (use-package ivy-bibtex
;;   :init
;;   (setq bibtex-completion-bibliography '("~/notes/references.bib")
;;         bibtex-completion-library-path '("~/OneDrive - zju.edu.cn/paper")
;;         ;;bibtex-completion-notes-path "~/Dropbox/emacs/bibliography/notes/"
;;         bibtex-completion-notes-template-multiple-files "* ${author-or-editor}, ${title}, ${journal}, (${year}) :${=type=}: \n\nSee [[cite:&${=key=}]]\n"

;;         bibtex-completion-additional-search-fields '(keywords)
;;         bibtex-completion-display-formats
;;         '((article       . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${journal:40}")
;;           (inbook        . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} Chapter ${chapter:32}")
;;           (incollection  . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${booktitle:40}")
;;           (inproceedings . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${booktitle:40}")
;;           (t             . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*}"))
;;         bibtex-completion-pdf-open-function
;;         (lambda (fpath)
;;           (call-process "open" nil 0 nil fpath))))

(use-package org-ref
  :ensure nil
  :init
  (require 'bibtex)
  (setq bibtex-autokey-year-length 4
        bibtex-autokey-name-year-separator "-"
        bibtex-autokey-year-title-separator "-"
        bibtex-autokey-titleword-separator "-"
        bibtex-autokey-titlewords 2
        bibtex-autokey-titlewords-stretch 1
        bibtex-autokey-titleword-length 5
        reftex-default-bibliography '("~/notes/references.bib")
        ;; https://github.com/jkitchin/org-ref/issues/974
        org-ref-activate-ref-links nil
        org-ref-activate-cite-links nil
        org-ref-validate-bibliography nil
        )
  (define-key bibtex-mode-map (kbd "H-b") 'org-ref-bibtex-hydra/body)
  (define-key org-mode-map (kbd "C-c ]") 'org-ref-insert-link)
  (define-key org-mode-map (kbd "s-[") 'org-ref-insert-link-hydra/body)
  (require 'org-ref-ivy)
  (require 'org-ref-arxiv)
  (require 'org-ref-scopus)
  (require 'org-ref-wos))




(require 'org-ref)
;;(add-hook 'org-mode-hook #'org-modern-mode)
(use-package mixed-pitch
  :hook
  ;; If you want it in all text modes:
  (org-mode . mixed-pitch-mode)
  :config
  )

(use-package org-sticky-header
  :hook
  (org-mode . org-sticky-header-mode))

(use-package org-appear
  :hook
  (org-mode . org-appear-mode))
(add-hook 'org-mode-hook (lambda ()
                           (electric-pair-mode -1)))
(defun set-newline-and-indent ()
  (local-set-key (kbd "RET") 'newline-and-indent))
(add-hook 'org-mode-hook 'set-newline-and-indent)


(setq mac-command-modifier 'meta)

(setq org-image-actual-width nil)


(use-package xenops
  :init (load-file "~/.doom.d/xenops/xenops.el")
  :ensure nil
  :load-path "~/.doom.d/xenops"
  :hook
  (org-mode . xenops-mode)
  :bind (
         (("C-c C-g C-c" . xenops-reveal-at-point))
         )
  )

(use-package latex-pretty-symbols
  :init (load-file "~/.doom.d/latex-pretty-symbols/latex-pretty-symbols.el")
  ;;:load-path "~/.doom.d/latex-pretty-symbols/latex-pretty-symbols.el"
  :hook
  (org-mode . latex-unicode-simplified)
  )

(use-package! org-superstar ; "prettier" bullets
  :hook (org-mode . org-superstar-mode)
  :config
  ;; Make leading stars truly invisible, by rendering them as spaces!
  (setq org-superstar-leading-bullet ?\s
        org-superstar-leading-fallback ?\s
        org-hide-leading-stars nil
        org-superstar-todo-bullet-alist
        '(("TODO" . 9744)
          ("[ ]"  . 9744)
          ("DONE" . 9745)
          ("[X]"  . 9745))))

(require 'unicode-fonts)
(unicode-fonts-setup)

(setq my-symbols-alist
      '(;;("[ ]" . ?☐)
        ;;("[X]" . ?☑)
        ;;("[-]" . ?⛝)

        ("#+ARCHIVE:" . ?📦)
        ("#+AUTHOR:" . ?👤)
        ("#+CREATOR:" . ?💁)
        ("#+DATE:" . ?📆)
        ("#+DESCRIPTION:" . ?⸙)
        ("#+EMAIL:" . ?📧)
        ("#+OPTIONS:" . ?⛭)
        ("#+SETUPFILE:" . ?⛮)
        ("#+TAGS:" . ?🏷)
        ("#+TITLE:" . ?📓)

        ("#+BEGIN_SRC" . ?✎)
        ("#+END_SRC" . ?□)
        ("#+begin_src" . ?✎)
        ("#+end_src" . ?□)
        ("#+BEGIN_QUOTE" . ?»)
        ("#+END_QUOTE" . ?«)
        ("#+HEADERS" . ?☰)
        ("#+RESULTS:" . ?💻)
        ))
(add-hook 'org-mode-hook
          (lambda ()
            (setq-local prettify-symbols-alist my-symbols-alist)))

;; (company-prescient-mode 1)
;; (add-hook 'emacs-lisp-mode-hook 'rainbow-mode)

(use-package texfrag
  :init (load-file "~/.doom.d/texfrag/texfrag.el")
  :hook
  (org-mode . texfrag-mode)
  (org-mode . texfrag-show-last-mode)
  :load-path "~/.doom.d/texfrag"
  :config
  (setq texfrag-scale 1
        texfrag-prefix (kbd "C-c C-g")
        texfrag-LaTeX-frag-alist '(("\\\\begin{tikzcd}" "\\\\end{tikzcd}"  :display t))
        ))

;;zero width space
(define-key org-mode-map (kbd "M-SPC M-SPC")
            (lambda () (interactive) (insert "\u200b")))


(global-prettify-symbols-mode +1)

;;(require 'nano)

(use-package rime
  :custom
  (default-input-method "rime"))


;; (use-package leetcode
;;   :custom
;;   (setq leetcode-prefer-language "c++"
;;         leetcode-prefer-sql "mysql"
;;         leetcode-save-solutions t
;;         leetcode-directory "~/miscellaneous/leetcode"))

(use-package shrface
  :defer t
  :config
  (shrface-basic)
  (shrface-trial)
  (shrface-default-keybindings) ; setup default keybindings
  (setq shrface-href-versatile t))

(require 'xterm-color)
(defun my-set-tab-mode ()
  (when (and (stringp buffer-file-name)
             (string-match "\\.log\\'" buffer-file-name))
    (xterm-color-colorize-buffer)))

(add-hook 'find-file-hook 'my-set-tab-mode)


(use-package eww
  :defer t
  :init
  (add-hook 'eww-after-render-hook #'shrface-mode)
  :config
  (require 'shrface))

(use-package nov
  :defer t
  :init
  (add-hook 'nov-mode-hook #'shrface-mode)
  :config
  (require 'shrface)
  (setq nov-shr-rendering-functions '((img . nov-render-img) (title . nov-render-title)))
  (setq nov-shr-rendering-functions (append nov-shr-rendering-functions shr-external-rendering-functions)))


;; BLOG THINGS
(require 'ox-publish)

(setq org-publish-project-alist
      `(("pages"
         :base-directory "~/miscellaneous/wugouzi.github.io/org"
         :base-extension "org"
         :recursive nil
         :publishing-directory "~/miscellaneous/wugouzi.github.io/"
         :publishing-function org-html-publish-to-html
         ;;:auto-sitemap t
         ;;:sitemap-filename "sitemap.org"
         :html-doctype "html5"
         :html-html5-fancy t
         :html-preamble "<nav>
  <a href=\"/\">&lt; Home</a>
</nav>
<div id=\"updated\">Updated: %C</div>"
         :html-head "<link rel=\"stylesheet\" href=\"/style.css\" type=\"text/css\"/>"
         )
        ("blogs"
         :base-directory "~/miscellaneous/wugouzi.github.io/org/blog/"
         :base-extension "org"
         :recursive t
         :publishing-directory "~/miscellaneous/wugouzi.github.io/html/"
         :publishing-function org-html-publish-to-html
         ;;:auto-sitemap t
         ;;:sitemap-filename "sitemap.org"
         :html-doctype "html5"
         :html-html5-fancy t
         :html-preamble "<nav>
  <a href=\"/\">&lt; Home</a>
</nav>
<div id=\"updated\">Updated: %C</div>"
         :html-head "<link rel=\"stylesheet\" href=\"/style.css\" type=\"text/css\"/>"
         )

        ("static"
         :base-directory "~/miscellaneous/wugouzi.github.io/org"
         :base-extension "css\\|txt\\|jpg\\|gif\\|png"
         :recursive t
         :publishing-directory  "~/miscellaneous/wugouzi.github.io/html/"
         :publishing-function org-publish-attachment)

        ("wugouzi.github.io" :components ("pages" "blogs" "static"))))


(defun compileandrun()
  (interactive)
  (let* ((src (file-name-nondirectory (buffer-file-name)))
         ;;;(exe (file-name-sans-extension src))
         (exe "test"))
    (compile (concat "g++ " src " -o " exe " && ./" exe))))


(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)


;; ;; ssh-deploy - prefix = C-c C-z, f = forced upload, u = upload, d = download, x = diff, t = terminal, b = browse, h = shell
;; ;; (add-to-list 'load-path "~/.emacs.d/ssh-deploy/")
;; (require 'ssh-deploy)
;; (ssh-deploy-line-mode) ;; If you want mode-line feature
;; (ssh-deploy-add-menu) ;; If you want menu-bar feature
;; (ssh-deploy-add-after-save-hook) ;; If you want automatic upload support
;; (ssh-deploy-add-find-file-hook) ;; If you want detecting remote changes support
;; (global-set-key (kbd "C-c C-z") 'ssh-deploy-prefix-map)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))


(defun clear-latex-temp-files () (shell-command "rm -rf _minted*"))

(dirvish-override-dired-mode)

;; (with-eval-after-load 'flycheck
;;(flycheck-grammarly-setup))

;; (setq flycheck-grammarly-check-time 0.8)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (latex . t)
   (c++ . t)
   (c . t)))
;; (global-wakatime-mode)

;; from https://emacs-china.org/t/org-mode-latex-mode/22490
;; (defun eli/xenops-preview-align-baseline (element &rest _args)
;;     (let* ((ov-beg (plist-get element :begin))
;;            (ov-end (plist-get element :end))
;;            (ov (car (overlays-at (/ (+ ov-beg ov-end) 2) t)))
;;            img new-img)
;;       (when ov
;;         (setq img (cdr (overlay-get ov 'display)))
;;         (setq new-img (plist-put img :ascent 90))
;;         (overlay-put ov 'display (cons 'image new-img)))))
;;   (advice-add 'xenops-math-display-image :after #'eli/xenops-preview-align-baseline)

;; (require 'bison)

;; (add-to-list 'auto-mode-alist '("\\.y$" . bison-mode))
;; (autoload 'bison-mode "bison")


;; (use-package magit-delta
;;   :hook (magit-mode . magit-delta-mode))

(use-package! magit-delta
  :after magit
  :config
  (setq
   ;;magit-delta-default-dark-theme "Monokai Extended"
   ;;magit-delta-default-light-theme "Github"
   magit-delta-hide-plus-minus-markers nil)
  (magit-delta-mode))

;; (after! lsp-clangd
;;   (setq lsp-clients-clangd-args
;;         '("-j=3"
;;           "--background-index"
;;           "--clang-tidy"
;;           "--completion-style=detailed"
;;           "--header-insertion=never"
;;           "--header-insertion-decorators=0"))
;;   (set-lsp-priority! 'clangd 2))

;; (add-to-list 'load-path "/Users/wu/.doom.d/lsp-bridge")

;; (require 'lsp-bridge)
;; (global-lsp-bridge-mode)
;; (setq lsp-bridge-c-lsp-server "ccls")
;; (remove-hook! '(c-mode-local-vars-hook
;;                c++-mode-local-vars-hook
;;                objc-mode-local-vars-hook
;;                cmake-mode-local-vars-hook)
;;              :append #'lsp!)

;;(use-package lsp-pyright
;;  :ensure t
;;  :hook (python-mode . (lambda ()
;;                          (require 'lsp-pyright)
;;                          (lsp))))  ; or lsp-deferred


;; (require 'auto-save)
;; (auto-save-enable)

;; (setq auto-save-silent t)   ; quietly save
;; (setq auto-save-delete-trailing-whitespace t)  ; automatically delete spaces at the end of the line when saving

;; ;;; custom predicates if you don't want auto save.
;; ;;; disable auto save mode when current filetype is an gpg file.
;; (setq auto-save-disable-predicates
;;       '((lambda ()
;;       (string-suffix-p
;;       "org"
;;       (file-name-extension (buffer-name)) t))))

;; (after! lsp-clangd
;;   (setq lsp-clients-clangd-args
;;         '("-j=3"
;;           "--background-index"
;;           "--clang-tidy"
;;           "--completion-style=detailed"
;;           "--header-insertion=never"
;;           "--header-insertion-decorators=0"))
;;   (set-lsp-priority! 'clangd 2))

(setq org-image-actual-width nil)

(defun +my/ccls-code-lens ()
  (when (member major-mode '(c-mode c++-mode))
    (ccls-code-lens-mode 1)))
(add-hook 'lsp-after-open-hook #'+my/ccls-code-lens)
(setq lsp-lens-enable nil)

(use-package lsp-mode
  :custom
  (lsp-rust-analyzer-server-display-inlay-hints t)
  (lsp-rust-analyzer-display-lifetime-elision-hints-enable "skip_trivial")
  (lsp-rust-analyzer-display-chaining-hints t)
  (lsp-rust-analyzer-display-lifetime-elision-hints-use-parameter-names nil)
  (lsp-rust-analyzer-display-closure-return-type-hints t)
  (lsp-rust-analyzer-display-parameter-hints nil)
  (lsp-rust-analyzer-display-reborrow-hints nil)
  )

;; rust
(setq
 rustic-cargo-test-exec-command "test")

;;(map! "C-," #'lsp-find-references)

;; (use-package exec-path-from-shell
;;   :ensure
;;   :init (exec-path-from-shell-initialize))


(defun show-file-name ()
  "Show the full path file name in the minibuffer."
  (interactive)
  (message (buffer-file-name))
  (kill-new (buffer-file-name)))


;; (setq pdf-view-use-scaling t)
;; pdf-view-use-imagemagick nil)


(add-to-list 'org-latex-classes
             '("ctex"
               "\\documentclass{ctexart}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(use-package lsp-java
  :defer t
  :init
  (setq lsp-java-server-install-dir
        "~/.emacs.d/jdtls/")
  :hook (java-mode . (lambda ()
                       (require 'lsp-java)
                       (lsp-common-set))))

(global-set-key (kbd "C-x f") 'project-find-file)

;; Debug
;; (setq dap-auto-configure-mode t)
;; (requires 'dap-cpptools)
