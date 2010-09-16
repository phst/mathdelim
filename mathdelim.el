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
 (function
  (lambda ()
    (TeX-run-style-hooks
     "etex" "expl3" "xparse" "xtemplate" "l3keys2e")
    (apply
     'TeX-add-symbols
     '("SetupMathDelimiters" "Settings")
     '("DeclareDelimiterSize" "Size" "Left" "Middle" "Right")
     '("UndeclareDelimiterSize" "Size")
     '("DeclareComplexDelimiterCommand" TeX-arg-define-macro "Settings" "Number of arguments" "Code")
     '("NewComplexDelimiterCommand" TeX-arg-define-macro "Settings" "Number of arguments" "Code")
     '("RenewComplexDelimiterCommand" TeX-arg-define-macro "Settings" "Number of arguments" "Code")
     '("ProvideComplexDelimiterCommand" TeX-arg-define-macro "Settings" "Number of arguments" "Code")
     '("DeclareSimpleDelimiterCommand" TeX-arg-define-macro "Settings")
     '("NewSimpleDelimiterCommand" TeX-arg-define-macro "Settings")
     '("RenewSimpleDelimiterCommand" TeX-arg-define-macro "Settings")
     '("ProvideSimpleDelimiterCommand" TeX-arg-define-macro "Settings")
     '("mathdelim" ["Size"] "Settings" t)
     '("mathdelim*" ["Size"] "Settings" t)
     "middledelim"
     "biggg" "bigggl" "bigggm" "bigggr"
     "Biggg" "Bigggl" "Bigggm" "Bigggr"
     '("mathvcenter" t))
     (apply
      'append
      (mapcar
       '(lambda (name)
          (list name ["Size"] t)
          (list (concat name "*") ["Size"] t))
       '("parens" "brackets" "braces" "chevrons"
         "set" "setprop"
         "cinterval" "lointerval" "rointerval" "ointerval"
         "eval" "innerprod"
         "abs" "norm" "floor" "ceil"
         "average" "commutator" "anticommutator"
         "bra" "ket" "braket" "braopket" "ketbra" "ketbraket"))))))
