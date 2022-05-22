; Functions in functions
(define (sum-of-squares x y)

  (define (square a)
    (* a a))

  (define (sum b c )
    (+ b c))

  (sum (square x) (square y)))