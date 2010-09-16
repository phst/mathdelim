;; Copyright (C) 2010 by Philipp Stephani <st_philipp@yahoo.de>
;;
;; This file may be distributed and/or modified under the
;; conditions of the LaTeX Project Public License, either
;; version 1.3c of this license or (at your option) any later
;; version.  The latest version of this license is in:
;;
;;    http://www.latex-project.org/lppl.txt
;;
;; and version 1.3c or later is part of all distributions of
;; LaTeX version 2009/09/24 or later.

(TeX-add-style-hook
 "mathdelim"
 (lambda ()
   (TeX-run-style-hooks
    "etex" "expl3" "xparse" "xtemplate" "l3keys2e")
   (TeX-add-symbols
    '("SetupMathDelimiters" "Settings")
    '("DeclareDelimiterSize" "Name" "Left" "Middle" "Right")
    '("UndeclareDelimiterSize" "Name")
    '("DeclareComplexDelimiterCommand" 'TeX-arg-define-macro "Settings" "Number of arguments" "Code")
    '("NewComplexDelimiterCommand" 'TeX-arg-define-macro "Settings" "Number of arguments" "Code")
    '("RenewComplexDelimiterCommand" 'TeX-arg-define-macro "Settings" "Number of arguments" "Code")
    '("ProvideComplexDelimiterCommand" 'TeX-arg-define-macro "Settings" "Number of arguments" "Code")
    '("DeclareSimpleDelimiterCommand" 'TeX-arg-define-macro "Settings")
    '("NewSimpleDelimiterCommand" 'TeX-arg-define-macro "Settings")
    '("RenewSimpleDelimiterCommand" 'TeX-arg-define-macro "Settings")
    '("ProvideSimpleDelimiterCommand" 'TeX-arg-define-macro "Settings")
    '("mathdelim" [ "Size" ] "Settings" t)
    "middledelim"
    "biggg" "bigggl" "bigggm" "bigggr"
    "Biggg" "Bigggl" "Bigggm" "Bigggr"
    '("mathvcenter" t))
   (mapc
    'TeX-mathdelim-add-delim
    '("parens" "brackets" "braces" "chevrons"
      "set" "setprop"
      "cinterval" "lointerval" "rointerval" "ointerval"
      "eval" "innerprod"
      "abs" "norm" "floor" "ceil"
      "average" "commutator" "anticommutator"
      "bra" "ket" "braket" "braopket" "ketbra" "ketbraket"))))

(defun TeX-mathdelim-add-delim (name)
  (interactive "s")
  (TeX-add-symbols
   (list name [ "Size "] t)))
