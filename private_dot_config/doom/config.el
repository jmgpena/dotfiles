;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Jorge Pena"
      user-mail-address "jorge@jmgpena.net")

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
                ;; :family "Iosevka Comfy"

(setq doom-font (font-spec
                :family "Fira Code"
                :size 13)
     doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))

;; (setq jmgpena-font-name (if IS-WINDOWS "FiraCode NF" "FiraCode Nerd Font"))
;; (setq doom-font (font-spec :family jmgpena-font-name :size 13))
;; (setq doom-big-font (font-spec :family jmgpena-font-name :size 24))
;; (setq doom-variable-pitch-font nil)

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/.org")
(setq org-default-notes-file (concat org-directory "/roam/20240328140236-life.org"))
(setq org-archive-location (concat org-directory "/archive/dailylog.org::datetree/"))
(setq org-agenda-files (list
                        (concat org-directory "/roam/20240328140236-life.org")
                        (concat org-directory "/dailylog.org")))
(setq org-agenda-text-search-extra-files (list
                                          (concat org-directory "/roam")))
(setq org-agenda-custom-commands
      '(("o" "Global Agenda"
         ((agenda "")
          (alltodo)))))
(require 'ox-latex)
(setq org-latex-listings 'minted)
(setq org-latex-pdf-process
      '("%latex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "%latex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "%latex -shell-escape -interaction nonstopmode -output-directory %o %f"))
(setq org-archive-save-context-info '(time file ltags itags category))
(setq org-superstar-headline-bullets-list '("▹"))
(setq org-ellipsis " ▾ ")
(setq org-ditaa-jar-path "~/.org/tools/ditaa-0.11.0-standalone.jar")
(setq deft-directory (concat org-directory "/roam"))
(setq org-crypt-key "jorge@jmgpena.net")
(setq org-todo-keywords
      '((sequence "TODO(t)" "TALK(l)" "REFINE(r)" "SCHEDULED(s)" "WAIT(w)" "HOLD(h)" "IDEA(i)" "|" "DONE(d)" "KILL(k)")
        (sequence "[ ](T)" "[-](S)" "[?](W)" "|" "[X](D)")
        (sequence "|" "OKAY(o)" "YES(y)" "NO(n)"))
      )
(map! :leader :desc "Cycle org agenda files" "o o" 'org-cycle-agenda-files)

;; org-roam UI
(map! :leader :desc "Open org-roam graph" "n r g" 'org-roam-ui-mode)
(use-package! websocket :after org-roam)
(use-package! org-roam-ui
  :after org-roam
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))

;; elfeed
(map! :leader :desc "Open RSS (n)ews feed" "o n" '=rss)
(add-hook! 'elfeed-search-mode-hook 'elfeed-update)
(after! elfeed
  (setq elfeed-search-filter "@2-weeks-ago +unread"
        elfeed-sort-order 'ascending
        elfeed-db-directory (concat org-directory "/elfeed")
        elfeed-goodies/entry-pane-size 0.5))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)

;; diff exe for Windows
(if IS-WINDOWS
    (setq diff-command "C:\\Users\\jorge\\scoop\\apps\\diffutils\\current\\usr\\bin\\diff.exe")
  )

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.
;; temporary fix for org-mode search
(after! evil
  (evil-select-search-module 'evil-search-module 'isearch))
