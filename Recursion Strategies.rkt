(require racket/trace)

(define (my-sum-nt lst)
  (cond
    ;; Basis
    [(empty? lst) 0]
    ;; Recursion
    [else
     (+ ;; Computation present (non-tail)
      (first lst) (my-sum-nt (rest lst)))]))

(trace my-sum-nt)

(define (my-last lst)
  (cond
    ;; Basis
    [(empty? (rest lst)) (first lst)]
    ;; Recursion
    [else
     ;; No Computation needed(tail)
     (my-last (rest lst))]))


(trace my-last)

;; p (posibly empty) list
(define (my-sum lst)
  ;; Immersion
  ;; p acum record all the values up to now.
  (define (my-sum-g lst acum)
    (cond
      ;; Basis
      [(empty? lst) acum]
      ;; Recursion
      [else
       ;; No computation (tail)
       (my-sum-g (rest lst) (+ acum (first lst)))]))
  
  ;; Initial call
  (trace my-sum-g) ;; debug-option
  (my-sum-g lst 0))

(trace my-sum) ;; debug-option

(require racket/trace)
;; p (possibly empty) list of numbers , number
(define (all-divisible-number? lst number)
  ;; Immersion
  (define (all-divisible-number-g lst number upto)
    (cond
      ;; Basis
      [(empty? lst) number]
      ;; Recursive
      [else
       (if (= (modulo (first lst) number) 0)
           (all-divisible-number-g (rest lst)
                                   number (+ 1 upto))
           upto)]))
  ;; Initial call and check
  (trace all-divisible-number-g) ;; debug-option
  (= (all-divisible-number-g lst number 0) (length lst)))

(trace all-divisible-number?)
           
;; p (possible empty) list    
(define (indices-of-elements lst)
  ;; Immersion
  ;; p
  ;; lst: remaining list, result up-to, index up-to
  (define (indices-of-elements-g lst res-up-to index-up-to)
    (cond
      ;; Basis
      [(empty? lst) res-up-to]
      ;; Recursive
      [else
       (indices-of-elements-g
        ;; remaining list
        (rest lst)
        ;; Computing partial result
        (cons (cons index-up-to (first lst)) res-up-to)
        ;; Increase "up to"                           
        (+ index-up-to 1))]))

  (trace indices-of-elements-g)
  ;; Initial call: (mind partial result and up-to)
  (indices-of-elements-g lst empty 0))

(trace indices-of-elements)


(require racket/list)
;; Right but Inefficient
(define (palindrome-inef lst)
  (cond
    ;; Basis
    [(empty? lst) #t]
    [(empty? (rest lst)) #t]
    ;; Recursion
    (else
     (and
      ;; check first against last element
      (equal? (first lst) (first (reverse lst)))
      ;; drop first and last element
      (palindrome-inef (take (rest lst) (- (length lst) 2)))))))

(trace palindrome-inef)
         

(define (palindrome-rev lst)
  ;; Immersion
  (define (palindrome-rev-g lst rev)
    (cond
      ;; Basis
      [(empty? lst) #t]
      [else
       (and
        (equal? (first lst) (first rev))
        (palindrome-rev-g (rest lst)(rest rev)))]))
  (trace palindrome-rev-g)
  ;; Initial call
  (palindrome-rev-g lst (reverse lst)))
                
(trace palindrome-rev)

;; Exercise 8

(define (palindrome? lst)
  ;; rev(lst) = rev(tmp) + rev
  ;; p : lst lst lst
  ;; q : pair of (pair lst lst) bool
  ;; pull up auxiliar to get traced.
  ;;
  (define (palindrome-g? lst tmp rev)
    (cond
      [(empty? tmp) (cons (cons lst rev) #t)]
      [else
       (let* ;; let* allows to reuse expressions.
           ([ res (palindrome-g? lst
                                 (rest tmp)
                                 (cons (first tmp) rev))]
            [ head1 (first (car (car res)))]
            [ tail1 (rest (car (car res)))]
            [ head2 (first (cdr (car res)))]
            [ tail2 (rest (cdr (car res)))]
            [ bool-remainder (cdr res)])
         ;; now I build the answer out.
         (cons (cons tail1 tail2)
               (and bool-remainder
                    (equal? head1 head2))))]))

  (trace palindrome-g?)
  (cdr (palindrome-g? lst lst empty)))

(trace palindrome?)