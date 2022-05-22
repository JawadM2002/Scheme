;; Learning about S-expressions (Symbolic expressions).
;; S-expressions are central to Scheme/LISP
;; An S-Expression is inductively defined as
;;  - either an atom
;;  - ( s1 ... sn ) where s1 are S-expressions

;; Lines starting with ;; are comments.
;; They are for human reading. Not processed.
;; Atoms
;;
;; Booleans
#f
#t
;; Numbers
2 3 4
4.5
;; Chars (are a bit tricky)
#\A
#\b
;; Strings 
"Hello"
" This is an string"

;; Predefined symbols
+
= 

;; 3 - 4
(- 3 4)

;; abs(-8)
(abs -8)
;; abs((1-34))
(abs (- 1 34))
;; (abs (1 - 34)) >= 0)
(>= (abs (- 1 34)) 0)

;; len("Hello")
(string-length "Hello")
;; "Hello " + " World!"
(string-append "Hello " " World!")
;; sqrt(len("Hello "+" World!")+12) 
(sqrt
 (+
  (string-length (string-append "Hello " " World!"))
  12
  )
 )
 
;; Conditional expressions
;;"... is Greater or" if (3>=0) else "...is lower"
(if (>= 3 0)
    "Three is Greater or Equal than 0"
    "Three is lower than 0"
    )

;; 45%2
(modulo 45 2)
;; 45%2 == 0
(= (modulo 45 2) 0)
;; See this complex expression
(if (= (modulo 45 2) 0)
    "45 is an even number"
    "45 is an odd number")

;; Compute
;; ("... divided by 6" if ((18%2==0) and (18%3==0)) else
;;  "... not divided by6")
(if (and
     (= (modulo 18 2) 0)
     (= (modulo 18 3) 0)
     )
    "18 is divided by 6"
    "18 is not divided by 6"
    )
     



;; cond statement
;; Approximation in Python
;; celsius=4
;; ("Summer if (celsius > 30) else
;; "Spring" if ((celsius > 20) and (celsius <= 30)) else
;; "Autumn" if ((celsius > 10)and (celsius <= 30)) else
;; "Winter"
(define celsius 14)
(cond
  [ (> celsius 30) "Summer"]
  [ (and (> celsius 20) (<= celsius 30)"Spring")]
  [ (and (> celsius 10) (<= celsius 20) "Autumn")]
  [ else "Winter" ]
  )

;; Defining symbols
;; my-pi=3.1415
(define my-pi 3.1415)
;; my-radius=1
(define my-radius 1)
;; lnOfCir = 2 * my-pi * my-radius
(define length-of-circurference (* 2 my-pi my-radius))



(define (my-abs n)
  (if (> n 0) n (- n)))

(my-abs -3)
(my-abs 218)