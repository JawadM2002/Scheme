; First class values of lambda forms
(lambda (x) (not x))
(lambda (x y) (+ x y))
(lambda (x y) (if (> x y) x y))

; Applying lambda forms
( (lambda (x) (not x)) #f)
(not #f)
( (lambda (x y) (+ x y)) 4 5)
( (lambda (x y) (if (> x y) x y)) 50 1 )
(if (> 50 1) 50 1)

; Naming - define the function before using it
(define my-add (lambda (x y) (+ x y)))
;(my-not #f)
;(my-not #f)
(my-add 3 6)

;; Functionals
;; Functions as parameters
(define (veredict f p q)
  (format "the result of ~a ~a is ~a"
          p
          q
          (f p q)))
(veredict
 (lambda (x y) (and x y)) ;; and function as a parameter
 #f #t)
(veredict (lambda (x y) (or x y)) #f #t) ;; or function as parameter
(veredict (lambda (x y) (- x y)) 2 4)
(veredict (lambda (x y) (+ x y)) 25 3)
(veredict (lambda (x y) (/ x y)) 90 2)
(veredict (lambda (x y) (* x y)) 20 5)