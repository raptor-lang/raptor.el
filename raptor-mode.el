;;; raptor-mode.el --- language support for raptorscript

;; Copyright (C) 2016 Tobias Pisani

;; Author: Tobias Pisani (topisani@hamsterpoison.com)
;; Version: 0.0.1
;; Package-Requires ()
;; Keywords: raptorscript, raptor
;; URL: https://github.com/raptor-lang/raptor.el

;;; Commentary:

;; Raptorscript is a programming language written as an educational exercise.
;; This is the Emacs package for raptorscript, currently just providing
;; some very basic syntax highlighting

;;; Code:

(defvar raptor-constants
  '("INT"
    "BOOL"
    "FLOAT"
    "STRING"))

(defvar raptor-keywords
  '("var" "fun" "if" "else" "true" "false"))

(defvar raptor-tab-width 2 "Width of a tab for Raptor mode.")

(defvar raptor-font-lock-defaults
  `((
     ("\"\\.\\*\\?" . font-lock-string-face)
     (":\\|<\\|>\\|!\\|=\\|+\\|-\\|*\\|/" . font-lock-keyword-face)
     ( ,(regexp-opt raptor-keywords 'words) . font-lock-keyword-face)
     ( ,(regexp-opt raptor-constants 'words) . font-lock-type-face)
     )))

;;;###autoload
(define-derived-mode raptor-mode fundamental-mode "Raptorscript"
  "Raptor mode is a major mode for editing raptorscript `.rapt' files"

  (setq font-lock-defaults raptor-font-lock-defaults)

  (when raptor-tab-width
    (setq tab-width raptor-tab-width))

  (setq comment-start "#")
  (setq comment-end "")

  (modify-syntax-entry ?# "< b" raptor-mode-syntax-table)
  (modify-syntax-entry ?\n "> b" raptor-mode-syntax-table))

;;;###autoload
(progn
  (add-to-list 'auto-mode-alist '("\\.rapt\\'" . raptor-mode))
  (modify-coding-system-alist 'file "\\.rapt\\'" 'utf-8))

(provide 'raptor-mode)

;;; raptor-mode.el ends here
