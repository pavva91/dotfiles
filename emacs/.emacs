(require 'package)
 
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
 
;; Use use-package to automatically install needed packages
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
;; (require 'diminish)
(require 'bind-key)

(use-package evil  :ensure t)
;; Enable Evil Mode
(require 'evil)
(evil-mode 1)

(setq package-enable-at-startup nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(wombat))
 '(package-selected-packages '(magit evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Set line number
(global-linum-mode t)

;; Set Relative line number
(defvar my-linum-current-line-number 0)

(setq linum-format 'my-linum-relative-line-numbers)

(defun my-linum-relative-line-numbers (line-number)
  (let ((test2 (- line-number my-linum-current-line-number)))
    (propertize
     (number-to-string (cond ((<= test2 0) (* -1 test2))
                             ((> test2 0) test2)))
     'face 'linum)))

(defadvice linum-update (around my-linum-update)
  (let ((my-linum-current-line-number (line-number-at-pos)))
    ad-do-it))
(ad-activate 'linum-update)

(global-linum-mode t)

;; Set Evil Mode
(put 'upcase-region 'disabled nil)

;; Download Evil
;;(unless (package-installed-p 'evil)
;;  (package-install 'evil))

;; Org Mode Settings
(defun air-pop-to-org-agenda (split)
  "Visit the org agenda, in the current window or a SPLIT."
  (interactive "P")
  (org-agenda-list)
  (when (not split)
    (delete-other-windows)))

(define-key global-map (kbd "C-c t a") 'air-pop-to-org-agenda)
(setq org-capture-templates
      '(("a" "My TODO task format." entry
         (file "todo.org")
         "* TODO %?
SCHEDULED: %t")))

(defun air-org-task-capture ()
  "Capture a task with my default template."
  (interactive)
  (org-capture nil "a"))

(define-key global-map (kbd "C-c c") 'air-org-task-capture)

(setq org-enforce-todo-dependencies t)
(setq org-log-done (quote time))
(setq org-log-redeadline (quote time))
(setq org-log-reschedule (quote time))


;;(after! org
(setq org-directory "~/org/")
;;(setq org-agenda-files '("~/org/agenda.org"))
(setq org-agenda-files '("~/org/"))
(setq org-agenda-custom-commands
      '(("c" "Simple agenda view"
         ((tags "PRIORITY=\"A\""
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "High-priority unfinished tasks:")))
          (agenda "")
          (alltodo "")))))
;; FINAL AGENDA (https://blog.aaronbieber.com/2016/09/24/an-agenda-for-life-with-org-mode.html)
;; I get error: Symbol's definition is void: air-org-skip-subtree-if-priority
;; (setq org-agenda-custom-commands
  ;;     '(("d" "Daily agenda and all TODOs"
    ;;      ((tags "PRIORITY=\"A\""
      ;;           ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
        ;;          (org-agenda-overriding-header "High-priority unfinished tasks:")))
          ;; (agenda "" ((org-agenda-ndays 1)))
          ;; (alltodo ""
            ;;        ((org-agenda-skip-function '(or (air-org-skip-subtree-if-habit)
              ;;                                      (air-org-skip-subtree-if-priority ?A)
                ;;                                    (org-agenda-skip-if nil '(scheduled deadline))))
                  ;;   (org-agenda-overriding-header "ALL normal priority tasks:"))))
         ;; ((org-agenda-compact-blocks t)))))
(setq org-todo-keywords
      '((sequence "TODO(t)" "IN-PROGRESS(p)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)" )))
;;(require 'org-bullets)
;;)
