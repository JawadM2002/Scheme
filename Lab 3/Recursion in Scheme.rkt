 (require racket/trace)

;; factorial
;; P : n >= 0 
(define (factorial n)
  ;;
  (cond
    ;; Base
    [(= n 0) 1]
    ;; Reduction
    [else
     ;; Computation
     (*
      n
      (factorial (- n 1)))])) ;; - sucessor.


;; Recursion
;; Add: [Int] -> Int
;; P: Any list of integers (even empty)
(define (sum-list l)
  ;;
  (cond
    ;; Basis case
    [(empty? l) 0]
    ;; General case.
    [else 
     (+    ;; computation
      (first l)
      (sum-list (rest l)))]))

;; P : Any non-empty lists of integers.
(define (my-max l)
  (cond
    ;; Basis case... Why?
    [(= (length l) 1) (first l) ]
    ;; General case.
    [else 
     (max ;; computation
      (first l)
      (my-max (rest l)))]))  ;; rest "successor"


;; Are all symbols?
;; P: A (posibly empty) list of any thing.
(define (all-symbols? lst)
  (cond
    ;; Basic case.... Why?
    [(empty? lst) #t]
     ;; General case
    [else   
     (and  ;; computation
      (symbol? (first lst))
      (all-symbols? (rest lst)))]))



  

;; recursion 
(define (my-reverse l)
  (cond
    ;; Base
    [(empty? l) l]
    ;; General
    [else
     ;; Constructor
     (append
      (my-reverse (rest l))
      (list (first l)))]))


;; 0 <= nth < len(lst)
(define (my-list-ref lst nth)
  (cond
    ;; Basis
    [(= nth 0) (first lst)  ]
    ;; General
    [else
     ;; No need computation
     (my-list-ref (rest lst) (- nth 1))]))      
  


;; deal 0 <= i <= j= len(lst)
;; Quote: (j-i) + len(lst)
(define (slice2 lst i j )
  ;;
  (cond
    ;; Base
    [(= i j)  empty]
    ;; General case 1
    [(> i 0)
     ;; Computation no needed
     (slice2 (rest lst) (- i 1 ) (- j 1))]
    ;; General case 2
    [else ;; i==0 and j>0
     ;; Computation
     (cons (first lst)
           (slice2 (rest lst) i (- j 1)))]))
           


;; replace atoms
(define (replace e1 e2 lst)
  ;;
  (cond
    ;; Base
    [(empty? lst) lst]
    [(equal? (first lst) e1) (cons e2 (replace e1 e2 (rest lst)))]))
