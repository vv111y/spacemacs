;;; header
;;;; packages.el --- outshine layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: Will Rempel <willy.rempel@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;; License: GPLv3

;;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `outshine-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `outshine/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `outshine/pre-init-PACKAGE' and/or
;;   `outshine/post-init-PACKAGE' to customize the package as it is loaded.

;;; packages
(defconst outshine-packages
  '((outorg :location elpa)
    (outshine :location elpa)
    (navi-mode :location elpa))

  "The list of Lisp packages required by the outshine layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

;; Must be set before outline is loaded
;; (defvar outline-minor-mode-prefix "\M-#")

;;; init-outorg
(defun outshine/init-outorg ()
  (use-package outorg
   :defer t
   ;; :commands
   :init
   (progn
     (defvar outline-minor-mode-prefix "\M-#")
     ;; (setq outline-minor-mode-prefix "\M-#")
     (spacemacs/declare-prefix "o" "outshine")
     (spacemacs/declare-prefix "oO" "outorg")
     (spacemacs/declare-prefix "ot" "todos")
     (spacemacs/declare-prefix "oi" "insert")
     (spacemacs/declare-prefix "oc" "nav")
     (spacemacs/declare-prefix "oC" "clock")
     (spacemacs/declare-prefix "os" "tree")
     (spacemacs/declare-prefix "om" "menu")
     (spacemacs/declare-prefix "ox" "execute")
     (spacemacs/declare-prefix "oe" "export")
     (spacemacs/declare-prefix "ol" "links")
     (spacemacs/declare-prefix "oa" "agenda")
     (spacemacs/declare-prefix "od" "dates")
     (spacemacs/declare-prefix "ok" "timer")
     (spacemacs/declare-prefix "oL" "latex")
     (spacemacs/declare-prefix "oT" "toggles")

     (spacemacs/set-leader-keys
       "ov" 'outorg-edit-as-org
       "on" 'outorg-copy-edits-and-exit
       "oOf" 'outorg-save-edits-to-tmp-file
       "oOE" 'outorg-edit-minor-mode
       "oOw" 'outorg-which-active-modes
       "oOx" 'outorg-insert-export-template-file
       "oOX" 'outorg-insert-default-export-template
       "oOR" 'outorg-replace-source-blocks-with-results
       "oOp" 'utorg-edit-comments-and-propagate-changes)   ;; (C-c M-# +)
     )
   ;; :config
   ))

;;; init-outshine
(defun outshine/init-outshine ()
  (use-package outshine
   :defer t
   ;; :commands
   :init
   (progn

;;;; mode hooks
     (add-hook 'outline-minor-mode-hook 'outshine-mode)
     (add-hook 'ansible-doc-mode-hook 'outline-minor-mode)
     (add-hook 'bibtex-mode-hook 'outline-minor-mode)
     (add-hook 'c-c++-mode-hooks 'outline-minor-mode)
     (add-hook 'clojure-mode-hook 'outline-minor-mode)
     (add-hook 'cmake-mode-hook 'outline-minor-mode)
     (add-hook 'common-lisp-mode-hook 'outline-minor-mode)
     (add-hook 'coq-mode-hook 'outline-minor-mode)
     (add-hook 'emacs-lisp-mode-hook 'outline-minor-mode)
     (add-hook 'ess-mode-hook 'outline-minor-mode)
     (add-hook 'go-mode-hook 'outline-minor-mode)
     (add-hook 'haskell-mode-hook 'outline-minor-mode)
     (add-hook 'html-mode-hook 'outline-minor-mode)
     (add-hook 'hy-mode-hook 'outline-minor-mode)
     (add-hook 'java-mode-hook 'outline-minor-mode)
     (add-hook 'javascript-mode-hook 'outline-minor-mode)
     (add-hook 'julia-mode-hook 'outline-minor-mode)
     (add-hook 'latex-mode-hook 'outline-minor-mode)
     (add-hook 'ledger-mode-hook 'outline-minor-mode)
     (add-hook 'lua-mode-hook 'outline-minor-mode)
     (add-hook 'message-mode-hook 'outline-minor-mode)
     (add-hook 'nim-mode-hook 'outline-minor-mode)
     (add-hook 'python-mode-hook 'outline-minor-mode)
     (add-hook 'php-mode-hook 'outline-minor-mode)
     (add-hook 'racket-mode-hook 'outline-minor-mode)
     (add-hook 'rust-mode-hook 'outline-minor-mode)
     (add-hook 'shell-mode-hook 'outline-minor-mode)
     (add-hook 'scala-mode-hook 'outline-minor-mode)
     (add-hook 'scheme-mode-hook 'outline-minor-mode)
     (add-hook 'sql-mode-hook 'outline-minor-mode)
     (add-hook 'yaml-mode-hook 'outline-minor-mode)
     (setq outshine-use-speed-commands t)

;;;; set keys
     (spacemacs/set-leader-keys

       "o." 'spacemacs/outshine-transient-state/body

;;;; todos
       "ott" 'outshine-todo
       "otp" 'outshine-priority
       "otT" 'outshine-toggle-checkbox

;;;; insert
       "oih" 'outshine-insert-heading
       "oid" 'outshine-insert-drawer
       "oip" 'outshine-set-property
       "oip" 'outshine-set-property-and-value
       "oit" 'outshine-set-tags-command


;;;; navigation & visibility
       "occ" 'outshine-cycle-buffer
       "ocC" 'outshine-force-cycle-comment
       "osn" 'outshine-narrow-to-subtree
       "oss" 'outshine-sort

;;;; misc
       "ocs" 'outshine-speed-move-safe
       "o?" 'outshine-speed-command-help
       "oo" 'outshine-open-at-point
       "of" 'outshine-footnote-action

;;;; menus
       ;; "omm" 'outshine-menu
       "omn" 'navi-search-and-switch
       "omq" 'navi-quit-and-switch


;;;; edit
       "oxs" 'outshine-toggle-subtree-comment-status
       "oxt" 'outshine-toggle-comment
       "oxr" 'outshine-comment-region
       "oxc" 'outshine-insert-comment-subtree
       "oxC" 'outshine-comment-subtree-content

;;;; execute?
       "oxe" 'outshine-eval-lisp-subtree
       "oxi" 'outshine-self-insert-command


;;;; export
       "oe" 'outshine-export-dispatch


;;;; links
       "oln" 'outshine-next-link
       "olN" 'outshine-previous-link
       "oli" 'outshine-insert-link
       "olI" 'outshine-insert-last-stored-link


;;;; agenda
       "oaa" 'outshine-agenda
       "oat" 'outshine-agenda-toggle-include-org-agenda
       "oaf" 'outshine-agenda-add-files
       "oaF" 'outshine-agenda-remove-files
       "oaL" 'outshine-agenda-remove-restriction-lock
       "oal" 'outshine-agenda-set-restriction-lock

;;;; dates
       "odd" 'outshine-deadline
       "ods" 'outshine-schedule
       "odt" 'outshine-time-stamp
       "odT" 'outshine-time-stamp-inactive

;;;; clock
       "oCi" 'outshine-clock-in
       "oCo" 'outshine-clock-out
       "oCg" 'outshine-clock-goto
       "oCc" 'outshine-clock-cancel
       "oCR" 'outshine-clock-report

;;;; effort
       "oie" 'outshine-set-effort
       "oiE" 'outshine-inc-effort

;;;; timer
       "okk" 'outshine-timer
       "oki" 'outshine-timer-item
       "oks" 'outshine-timer-start
       "okS" 'outshine-timer-set-timer

;;;; latex
       "oLh" 'outshine-latex-insert-header
       "oLH" 'outshine-latex-insert-headers-in-buffer
       "oLx" 'outshine-TeX-command-region-on-subtree


;;;; TOGGLES
       "oTs" 'outshine-toggle-silent-cycling
       "oTw" 'outshine-toggle-fixed-width

;;;;; toggle hide/show
       "oTc" 'outshine-hide-hidden-lines-cookies
       "oTC" 'outshine-show-hidden-lines-cookies
       "oTd" 'outshine-toggle-hidden-lines-cookies
       "oTD" 'outshine-toggle-hidden-lines-cookies-activation)
     )
   ))

;;; init-navi-mode
(defun outshine/init-navi-mode ()
  (use-package navi-mode
    :defer t
    ;; :commands
    :init
    :config
    ))
;;; packages.el ends here
