;; This exercise involves many things...
;; recursion, metapprogramming, symbolic computation...
;;
;; Please, feel free to support student as much as he might need.
;; back to infix-eval
(define (infix-eval exp)
  (cond
   [ (not (list? exp)) exp ]
   [ else (
           apply (eval (second exp))
                 (list (infix-eval (first exp))
                       (infix-eval (third exp))
                       )
                 )]))

(infix-eval '(((3 + 2) / 5) + (1 - 5)))
(infix-eval '3)
(infix-eval '(((3 + 2) / 5) + (1 - 5)))