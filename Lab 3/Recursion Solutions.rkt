require racket/trace)
;; Exercise 1

;; is-sorted?
;; P : list probably empty of integers.
(define (is-sorted? lst)
  ;; Basis
  (cond
    [(<= (length lst) 1) #t] ;;  it is true.
    [else
     (and
      (<= (first lst) (second lst))
      (is-sorted? (rest lst)))]))

;; frequency
;; P : list probably empty of integers.
;;     num integer
(define (frequency lst num)
  (cond
    [(empty? lst) 0]
    ;; Others
    [(= (first lst) num) (+ 1 (frequency (rest lst) num))]
    [else (frequency (rest lst) num)]))

;; flat
;; P : list probably empty of any
;;
(define (flat? lst)
  (cond
    [(empty? lst) #t]
    [else
     (and
      (not (list? (first lst)))
      (flat? (rest lst)))]))

;; P :  Must have at least one!
(define (last lst)
  ;;
  (cond
    [ (empty? (rest lst)) (first lst) ]
    [else (last (rest lst))]))

;; Exercise 2
;; replacement
;; P : list probably empty of any given data
;;  any for old and new symbols
(define (replace lst old new)
  ;;
  (cond
    [(empty? lst) empty ]
    [(equal? (first lst) old) (cons new (replace (rest lst) old new ))]
    [else (cons (first lst) (replace (rest lst) old new))]))


;; nth element
;; P : 0 <= n < len(lst)
(define (my-list-ref lst n)
  (cond
    [(= n 0) (first lst)]
    [else (my-list-ref (rest lst) (- n 1))]))

;; P : 0 <= n <= lst(n)
(define (getFirst lst n)
  (cond
    [(= n 0) empty]
    [else (cons (first lst) (getFirst (rest lst) (- n 1 )))]))
             
;; P : given list possibly empty of any
;;    0 <= n <= len(lst)
(define (discardFirst lst n)
  (cond
    [(= n 0) lst]
    [else (discardFirst (rest lst) (- n 1))]))
  
;; P : any posible empty list of integers.
;; 
(define (numOfPeaks lst)
  (cond
    [(<= (length lst) 2) 0]
    [else
     (if (and
          (< (first lst) (second lst))
          (< (third lst) (second lst)))
         (+ 1 (numOfPeaks (rest lst)))
         (numOfPeaks (rest lst)))]))



;; Define my dictionary.
(define my-dict (list (cons 'andrew 2) ( cons 'ralph 5) (cons 'yassmine 3)))
;; is-dictionary?
;; P : a Given lst
(define (is-dictionary? lst)
  (cond
    [(empty? lst) #t]
    [else (let
              ([a (first lst)])
            (and (pair? a)
                 (symbol? (car a))
                 (is-dictionary? (rest lst))))]))

;; Uncomment
;;(is-dictionary? (list (cons 'car 2) ( cons 4 5)))
;;(is-dictionary? (list (cons 'car 2) ( cons 'r 5)))


;; keys
;; P : A given dictionary
(define (keys-dict dict)
  ;;
  (cond
    [(empty? dict) empty]
    [else
     (cons (car (first dict)) (keys-dict (rest dict)))
     ]
    ))

;; keys
;; P : A given dictionary
(define (values-dict dict)
  ;;
  (cond
    [(empty? dict) empty]
    [else
     (cons (cdr (first dict)) (values-dict (rest dict)))
     ]
    ))

;; dictionary
;; P : length dictionary
(define (length-dict dict)
  ;;
  (cond
    [(empty? dict) 0]
    [else
     (+ 1 (length-dict (rest dict)))]))

;; P : Should be not empty!
;; Must contain the key
(define (value dict key)
  (cond
    [(empty? dict) (first dict)] ;; This is failure
    ;;  [ (= 1 (length-dict dict)) (cdr (first lst))] ;; Shoud be the vlaue   
    [else
     (if (equal? (car (first dict)) key)
         (cdr (first dict))
         (value (rest dict) key))]))

;; P : Must be passed a dictionary
(define (contains-key? dict key)
  (cond
    [(empty? dict) #f]
    [else
     (or
      (equal? (car (first dict)) key)
      (contains-key? (rest dict) key))]))


;; P : A dictionary possible empty.
(define (set-value dict key value)
  (cond
    ;; Base
    [(empty? dict) (list (cons key value))]
    ;; Base  ; we found the key.
    [(equal? (car (first dict)) key)
     (cons
      ;; changing actual value for the new
      ;; the rest of dictionary keeps the same
      (cons (car (first dict)) value)  (rest dict))]
    ;; General. first pair is kept. try to apply on second...
    [else ( cons (first dict) (set-value (rest dict) key value))]))
