(setq-default indent-tabs-mode nil)

(setq inhibit-startup-screen t)
(setq require-final-newline t)

;(set-face-attribute 'default nil :font "DejaVu Sans Mono-10")

;; completion mode
(setq minibuffer-complete-cycle 'auto)

;; highlight region between point and mark
(setq transient-mark-mode t)

;; highlight during query
(setq query-replace-highlight t)

;; highlight incremental search
(setq search-highlight t)

;; eliminate long "yes" or "no" prompts
(fset 'yes-or-no-p 'y-or-n-p)

;; Custom mode configurations
;;
;; turn off the menu bar
(menu-bar-mode -1)
;;
;; turn off the tool bar
(tool-bar-mode -1)
;;
;; turn off the scroll bar
(scroll-bar-mode -1)

;; add time to mode line
(setq display-time-24hr-format t)
(display-time-mode t)

(setq backup-by-copying t
      backup-directory-alist '(("." . "~/.emacs.d/backup"))
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

(setq package-enable-at-startup nil)
(setq package-archives
      '(("gnu"         . "http://elpa.gnu.org/packages/")
        ("marmalade"   . "http://marmalade-repo.org/packages/")
        ("melpa"       . "http://melpa.milkbox.net/packages/")
        ("org"         . "http://orgmode.org/elpa/")))
(package-initialize)

; defvar is the correct way to declare global variables
; you might see setq as well, but setq is supposed to be use just to set variables,
; not create them.
(defvar required-packages '(haskell-mode
                            minibuffer-complete-cycle
                            monokai-theme
                            smart-tabs-mode
                            zenburn-theme) "a list of packages to ensure are installed at launch.")

(require 'cl)

; method to check if all packages are installed
(defun packages-installed-p ()
  (loop for p in required-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

; if not all packages are installed, check one by one and install the missing ones.
(unless (packages-installed-p)
  ; check for new packages (package version)
  (message "%s" "Emacs is now refreshing its packages database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ; install the missing packages
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(smart-tabs-insinuate 'c 'c++ 'java 'javascript 'python 'ruby)

(add-hook 'c-mode-common-hook
          (lambda () (setq c-basic-offset 8
                           indent-tabs-mode t)))

(add-hook 'java-mode-hook
          (lambda () (setq c-basic-offset 8
                           indent-tabs-mode t)))

(add-hook 'python-mode-hook
          (lambda () (setq python-indent 8
                           indent-tabs-mode t)))

(add-hook 'ruby-mode-hook
          (lambda () (setq indent-tabs-mode t)))

(require 'ispell)
(setq ispell-program-name "hunspell")
(setq ispell-local-dictionary-alist '((nil
                                       "[[:alpha:]]" "[^[:alpha:]]" "[']"
                                       nil ("-d" "en_US") nil iso-8859-1)
                                      ("american"
                                       "[[:alpha:]]" "[^[:alpha:]]" "[']"
                                       nil ("-d" "en_US") nil iso-8859-1)
                                      ("brasileiro"
                                       "[[:alpha:]]" "[^[:alpha:]]" "[']"
                                       nil ("-d" "pt_BR") nil iso-8859-1)))

(put 'upcase-region 'disabled nil)

(load-theme 'monokai t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(haskell-mode-hook (quote (turn-on-haskell-indent
                             interactive-haskell-mode)))
 '(haskell-indent-after-keywords (quote (("where" 4 0)
                                         ("of" 4)
                                         ("do" 4)
                                         ("mdo" 4)
                                         ("rec" 4)
                                         ("in" 4 0)
                                         ("{" 4)
                                         "if"
                                         "then"
                                         "else"
                                         "let")))
 '(haskell-indent-offset 4)
 '(haskell-indent-spaces 4)
 '(haskell-indent-thenelse 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
