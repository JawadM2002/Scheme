;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Exercise 1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Absolute
(lambda (u) (if (>= u 0) u (- u)))
;; multiple
(lambda (m n) (= (modulo m n) 0))
;; predicates
(lambda (pred? lst) (ormap pred? lst))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Exercise 2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Computing primes
(require racket)  ;; importing range

;; Computing prime number
;; P : n>= 2
(define (prime? n)
  (empty?
   (filter
    (lambda (v) (= (modulo n v) 0))
    (range 2 n))))

;; Filter primes
;; P : list posibly empty of integers
(define (filterPrimes lst)
  (filter
   (lambda (u) (prime? u))  ;; See this predicate.
   lst))

;; Computing primes before 100 . Uncomment.
;;(filterPrimes (range 2 100))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Exercise 3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Define functionals

;; Renaming andmap
(define forall? andmap)

;; Implementing exists
;; Note the law exits x phi(x) ~ not forall x not phi(x)
(define (exists?  pred? lst)
  (not (forall?
        (lambda (u) (not (pred? u)))
        lst)))


;; Selective Sum
;; Version one
(define (selectiveSum pred? lst)
  (apply
   +
   (filter pred? lst)))


;; Version two
(define (selectiveSum2 pred? lst)
  (foldl
   (lambda (u n) (if (pred? u) (+ u n) n))
   0
   lst))


;; Partition
(define (my-partition pred? lst)
  (cons
   (filter pred? lst)
   (filter
    (lambda (u) (not (pred? u))) lst)))











