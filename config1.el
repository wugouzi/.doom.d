
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
 ;; '(variable-pitch ((t (:family "Source Han Serif SC" :height 120))))
 ;;'(fixed-pitch ((t ( :family "iA Writer Mono S" :height 111))))
 ;;'(fixed-pitch ((t ( :family "Ios" :height 111))))
 )

(require 'org-indent)
(use-package org
  :hook
  ((org-mode . auto-fill-mode)
   (org-mode . mixed-pitch-mode)
   (org-mode . (lambda () (setq fill-column 110)))
   (org-mdoe . org-latex-preview-auto-mode)
   ;; (org-mode . valign-mode)
   )

  :config
  (setq org-highlight-latex-and-related '(script entities)
        org-latex-preview-process-precompiled t
        org-startup-indented nil
        org-hide-emphasis-markers t
        ;; org-latex-listings 'minted
        org-latex-pdf-process (quote
                               ("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
        ;; inline image size
        org-image-actual-width 600
        org-emphasis-alist
        '(("*" bold)
          ("/" italic)
          ("_" underline)
          ("=" org-verbatim verbatim)
          ("~" org-code verbatim)
          ;; ("+" (:strike-through t))
          )
        )
  (set-company-backend! 'org-mode '(company-dabbrev :with company-yasnippet))
  )

(use-package org-latex-preview
  :config
  ;; Increase preview width
  (plist-put org-latex-preview-appearance-options
             :page-width 1.0)

  ;; Use dvisvgm to generate previews
  ;; You don't need this, it's the default:
  (setq org-latex-preview-process-default 'dvisvgm)

  ;; Turn on auto-mode, it's built into Org and much faster/more featured than
  ;; org-fragtog. (Remember to turn off/uninstall org-fragtog.)
  (add-hook 'org-mode-hook 'org-latex-preview-auto-mode)

  ;; Block C-n and C-p from opening up previews when using auto-mode
  (add-hook 'org-latex-preview-auto-ignored-commands 'next-line)
  (add-hook 'org-latex-preview-auto-ignored-commands 'previous-line)

  ;; Enable consistent equation numbering
  (setq org-latex-preview-numbered t)

  (setq org-latex-preview-process-precompiled t)

  (setq org-latex-compiler "xelatex")

  (setq org-startup-with-latex-preview t)

  (setq org-latex-preview-appearance-options
        '(:foreground auto
          :background "Transparent"
          :scale 1.5
          :zoom 1.1
          :page-width 1.0
          :matchers ("begin" "$1" "$" "$$" "\\(" "\\[")))

  ;; Bonus: Turn on live previews.  This shows you a live preview of a LaTeX
  ;; fragment and updates the preview in real-time as you edit it.
  ;; To preview only environments, set it to '(block edit-special) instead
  (setq org-latex-preview-live t)

  ;; More immediate live-previews -- the default delay is 1 second
  (setq org-latex-preview-live-debounce 0.25)
  )

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


(use-package org-appear
  :after org
  :hook
  (org-mode . org-appear-mode))

(use-package org-sticky-header
  :after org
  :hook
  (org-mode . org-sticky-header-mode))

(use-package org-ref
  ;; :ensure nil
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
        bibtex-completion-bibliography '("~/notes/references.bib")
        )
  (define-key bibtex-mode-map (kbd "H-b") 'org-ref-bibtex-hydra/body)
  (define-key org-mode-map (kbd "C-c ]") 'org-ref-insert-link)
  (define-key org-mode-map (kbd "s-[") 'org-ref-insert-link-hydra/body)
  ;; (require 'org-ref-ivy)
  (require 'org-ref-arxiv)
  (require 'org-ref-scopus)
  (require 'org-ref-wos))


(use-package latex-pretty-symbols
  :init (load-file "~/.doom.d/latex-pretty-symbols/latex-pretty-symbols.el")
  ;;:load-path "~/.doom.d/latex-pretty-symbols/latex-pretty-symbols.el"
  :hook
  (org-mode . latex-unicode-simplified)
  )

(use-package svg-tag-mode
  :after org
  :hook (org-mode . org-sticky-header-mode)
  :config
  (setq svg-tag-tags
        '((":TODO:" . ((lambda (tag)
                         (svg-tag-make tag :beg 1 :end -1)))))
        )
  )

;; for vertico
;; (use-package consult
;;   :bind (("C-s" . consult-line)
;;          )
;;   )
(use-package swiper
  :bind (("C-s" . swiper-isearch)))

;; https://www.reddit.com/r/emacs/comments/ev7igv/why_is_auctex_loaded_using_usepackage_tex_instead/
(use-package tex
  :ensure auctex
  :init
  (setq preview-auto-cache-preamble t
        preview-default-preamble
        (quote
         ("\\RequirePackage["
          ("," . preview-default-option-list)
          "]{preview}[2004/11/06]"
          "\\PreviewEnvironment{tikzcd}"
          "\\PreviewEnvironment{tikzpicture}"
          "\\PreviewEnvironment{center}"
          "\\PreviewEnvironment{algorithmic}"
          "\\PreviewEnvironment{itemize}"
          "\\PreviewEnvironment{figure}"))
        preview-dvipng-image-type (quote png)
        TeX-command-extra-options "-shell-escape"
        ;;'(Evince)
        TeX-engine 'xetex
        +latex-viewers '(skim)
        preview-transparent-color nil)
  :hook
  (
   (LaTeX-mode . turn-on-reftex)
   (plain-TeX-mode . LaTeX-mode)
   )
  :config
  (setq TeX-engine 'xetex))

(setq TeX-engine 'xetex)

(use-package company
  :init
  (setq
   ;; company-tooltip-align-annotations t
   ;; company-tooltip-limit 12
   company-idle-delay 0
   ;; company-echo-delay (if (display-graphic-p) nil 0)
   ;; company-minimum-prefix-length 2
   ;; company-require-match nil
   company-dabbrev-ignore-case nil
   company-dabbrev-downcase nil
   company-dabbrev-minimum-length 4
   ;; company-dabbrev-char-regexp "[A-Za-z]+"
   )
  :config
  )

;; 'company-math-symbols-latex 'company-latex-commands 'company-yasnippet
;; (after! org-mode
;;   (set-company-backend! 'org-mode nil))
;; (after! org-mode
;;   (set-company-backend! 'org-mode '(company-dabbrev :with company-yasnippet)))

;; (use-package lsp-mode
;;   :custom
;;   (lsp-rust-analyzer-server-display-inlay-hints t)
;;   (lsp-rust-analyzer-display-lifetime-elision-hints-enable "skip_trivial")
;;   (lsp-rust-analyzer-display-chaining-hints t)
;;   (lsp-rust-analyzer-display-lifetime-elision-hints-use-parameter-names nil)
;;   (lsp-rust-analyzer-display-closure-return-type-hints t)
;;   (lsp-rust-analyzer-display-parameter-hints nil)
;;   (lsp-rust-analyzer-display-reborrow-hints nil)
;;   )


(setq
 rustic-cargo-test-exec-command "test")

(after! lsp-clangd
  (setq lsp-clients-clangd-args
        '("-j=3"
          "--background-index"
          "--clang-tidy"
          "--completion-style=detailed"
          "--header-insertion=never"
          "--header-insertion-decorators=0"))
  (set-lsp-priority! 'clangd 2))

;; annoying org warnings
(setq warning-minimum-level :error)

(add-to-list 'org-latex-classes
                 '("fduthesis" "\\documentclass{fduthesis}"
                   ("\\chapter{%s}" . "\\section*{%s}")
                   ("\\section{%s}" . "\\subsection*{%s}")
                   ("\\subsection{%s}" . "\\subsubsection*{%s}")
                   ("\\paragraph{%s}" . "\\paragraph*{%s}")
                   ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
