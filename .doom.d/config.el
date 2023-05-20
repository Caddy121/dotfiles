;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Caddy Tran"
      user-mail-address "caddy121.code@gmail.com")

(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 13 :weight 'light))
(setq doom-theme 'doom-spacegrey)
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(after! doom-modeline
  (setq doom-modeline-buffer-file-name-style 'relative-to-project
        doom-modeline-icon t
        doom-modeline-major-mode-color-icon t
        doom-modeline-buffer-state-icon t
        doom-modeline-buffer-modification-icon t
        doom-modeline-highlight-modified-buffer-name t
        doom-modeline-lsp t))
(setq fancy-splash-image "~/.doom.d/I-am-doom.png")
;; (setq initial-buffer-choice (lambda () (switch-to-buffer "*dashboard*")))
(defun my/focus-new-client-frame ()
  (select-frame-set-input-focus (selected-frame)))
(add-hook 'server-after-make-frame-hook #'my/focus-new-client-frame)

;; (add-to-list 'load-path "~/.doom.d/lsp-bridge/")
;; (require 'yasnippet)
;; (yas-global-mode 1)
;; (require 'lsp-bridge)
;; (global-lsp-bridge-mode)
;; (evil-define-key 'insert lsp-bridge-mode-map
;;   (kbd "Return" nil)
;;   (kbd "C-e" 'acm-hide))
;; (setq acm-frame-background-dark-color t)
;; (map! :leader
;;       (:prefix-map ("l" . "lsp")
;;        :desc "Find definition" "d" #'lsp-bridge-find-def
;;        :desc "Code actions" "a" #'lsp-bridge-code-action
;;        :desc "Find implementation" "i" #'lsp-bridge-find-impl
;;        :desc "Find references" "R" #'lsp-bridge-find-references
;;        :desc "Rename" "r" #'lsp-bridge-rename
;;        :desc "Restart LSP Bridge" "p" #'lsp-bridge-restart-process
;;        :desc "Kill all process" "k" #'lsp-bridge-kill-process))

(cond (IS-MAC
       (setq mac-command-modifier       'super
             mac-option-modifier        'meta
             mac-right-option-modifier  'meta)))

(global-set-key (kbd "<end>") #'move-end-of-line)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "<home>") #'move-beginning-of-line)

(set-charset-priority 'unicode)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq-default buffer-file-coding-system 'utf-8)

(setq-default
  backup-inhibited t
  evil-shift-width tab-width
  delete-by-moving-to-trash t
  indent-tabs-mode nil
  tab-width 2)

(setq auto-save-default nil
      confirm-kill-emacs nil
      create-lockfiles nil
      display-line-numbers-type 'relative
      fill-column 80
      find-file-visit-truename t
      gc-cons-threshold 100000000
      inhibit-compacting-font-caches t
      make-backup-files nil
      read-process-output-max (* 1024 1024)
      ring-bell-function 'ignore
      scroll-conservatively 101
      scroll-margin 8
      scroll-preserve-screen-position 'always
      scroll-step 1
      vc-follow-symlinks t
      vc-make-backup-files nil
      version-control t)

(fset 'yes-or-no-p 'y-or-n-p)
(repeat-mode)
;; (savehist-mode 1)
(transient-mark-mode t)

(global-auto-revert-mode 1)
(global-font-lock-mode t)
(global-hl-line-mode)

(setq avy-all-windowss t)

(setq evil-move-cursor-back nil
      evil-split-window-below t
      evil-vsplit-window-right t
      evil-want-fine-undo t
      +evil-want-o/O-to-continue-comments nil)
(setq-default evil-kill-on-visual-paste nil)

;; (setq
;;  centaur-tabs-gray-out-icons 'buffer
;;  centaur-tabs-height 24
;;  centaur-tabs-set-bar 'over
;;  centaur-tabs-set-icons t
;;  centaur-tabs-set-modified-marker t
;;  centaur-tabs-style 'chamfer
;;  )
;; (map! :leader
;;       :desc "Global tabs" "t a" #'centaur-tabs-mode
;;       :desc "Local tabs" "t C" #'centaur-tabs-local-mode)
;; (evil-define-key 'normal centaur-tabs-mode-map
;;   (kbd "C-p") 'centaur-tabs-forward
;;   (kbd "C-f") 'centaur-tabs-backwar
;;   (kbd "g T") 'centaur-backward-group
;;   (kbd "g t") 'centaur-forward-group)
;; (after! dired)
;; (add-hook 'rired-mode-hook 'centaur-tabs-local-mode)

(setq company-idle-delay 0
      company-minimum-prefix-length 1
      company-selection-wrap-around t
      company-tooltip-align-annotations t)

(use-package lsp-mode
  :config
  (add-hook 'prisma-mode-hook #'lsp-deferred))
(setq lsp-log-io nil)

(use-package multi-vterm
  :config
  (add-hook 'vterm-mode-hook
            (lambda ()
              (setq-local evil-insert-state-cursor 'box)
              (evil-insert-state)))
  (define-key vterm-mode-map [return]                      #'vterm-send-return)

  (setq multi-vterm-dedicated-window-height-percent 30)
  (setq vterm-keymap-exceptions nil)
  (evil-define-key 'insert vterm-mode-map (kbd "C-e")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-f")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-a")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-v")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-b")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-w")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-u")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-d")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-n")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-m")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-p")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-j")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-k")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-r")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-t")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-g")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-c")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-SPC")    #'vterm--self-insert)
  (evil-define-key 'normal vterm-mode-map (kbd "C-d")      #'vterm--self-insert)
  (evil-define-key 'normal vterm-mode-map (kbd ",c")       #'multi-vterm)
  (evil-define-key 'normal vterm-mode-map (kbd ",n")       #'multi-vterm-next)
  (evil-define-key 'normal vterm-mode-map (kbd ",p")       #'multi-vterm-prev)
  (evil-define-key 'normal vterm-mode-map (kbd "i")        #'evil-insert-resume)
  (evil-define-key 'normal vterm-mode-map (kbd "o")        #'evil-insert-resume)
  (evil-define-key 'normal vterm-mode-map (kbd "<return>") #'evil-insert-resume))

(setq projectile-project-search-path
      '("~/Desktop/Coding/" "~/.config/" "~/.doom.d/"))

(setq which-key-idle-delay 0.5)


(after! auth-source
  (setq auth-sources (nreverse auth-sources)))

(after! js
  (setq-default js--prettify-symbols-alist '()))

(after! persp-mode
  (setq persp-emacsclient-init-frame-behaviour-override "main"))


(map! :after company
      :map company-active-map
      "TAB" #'company-complete-selection
      "<tab>" #'company-complete-selection
      "RET" nil
      "<return>" nil)

(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'typescript-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)
(setq prettier-js-args '(
                         "--single-quote" "true"
                         "--jsx-single-quote" "true"
                         ))


;; (load! "+bindings")
;; (load! "+lsp")

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
