;; -*- mode:lisp -*-

(in-package :lem-user)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Looks 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load-library "pygments-colorthemes")
(load-theme   "monokai")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Vars 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setf *scroll-recenter-p* t)
(setf (variable-value 'truncate-lines                :global) nil)
(setf (variable-value 'lem.line-numbers:line-numbers :global) nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Init Modes 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; VI
(lem-vi-mode:vi-mode)

;; PAREDIT
(lem:add-hook lem:*find-file-hook*
              (lambda (buffer)
                (when (eq (buffer-major-mode buffer) 'lem-lisp-mode:lisp-mode)
                  (change-buffer-mode buffer 'lem-paredit-mode:paredit-mode t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Keybindings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; General
(define-key lem:*global-keymap* "Space f f" 'lem:find-file)
(define-key lem:*global-keymap* "Space b b" 'lem:switch-to-buffer)

;; VI
(define-key lem-vi-mode:*command-keymap* "q"  'quit-window)
(define-key lem-vi-mode:*insert-keymap* "C-n" 'lem.abbrev:abbrev-with-pop-up-window)
(define-key lem-vi-mode:*insert-keymap* "j k" 'lem-vi-mode.commands:vi-end-insert)

;; CL
(define-key lem-lisp-mode:*lisp-mode-keymap* "Space e e" 'lem-lisp-mode:lisp-eval-last-expression)
(define-key lem-lisp-mode:*lisp-mode-keymap* "Space e f" 'lem-lisp-mode:lisp-load-file)

