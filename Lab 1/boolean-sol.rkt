;; Propositional logic with Scheme
;; 1.- 
(define p #f)
(define q #t)
;; 2.- 
(not p)
(and p q)
(not (and p q))
(or (not p) q)
(not (not p))
;; ....
;; 3.- 
(define (my-nand p q) (not (and p q)))
(define (my-nor p q)  (not (or p q)))
(define (my-xor p q)  (and (or p q) (not (and p q))))
;; 4 .- 
(my-nand p p)
(my-xor p p)
(my-nor p p)
;; Other more complex formulas.
(my-nand q (my-nand p p))

  