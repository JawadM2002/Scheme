;; Using recursion and lists...
(define my-numbers (list 1 2 3 4 5 6 7 8 9 10))

(define (filter-even lst)
  ;; Program the body
  (cond
    ;; Basis case
    [(empty? lst) lst]
    ;; Recursive case
    ;; if (lst[0]%2==0)
    [(if (even? (first lst)) 
         ;; [lst[0]]+filter-even(lst[1:])
         (cons (first lst) (filter-even (rest lst)))
         ;; filter-even(lst[1:])
         (filter-even (rest lst))
         )]))

;; Computing eucllidean distance
;; sqrt((x1-x2)^2 + (y1-y2)^2)
(define (euclidean p1 p2)
  (sqrt( + 
        
         (*
          (- (car p1) (car p2))
          (- (car p1) (car p2)))

         (*
          (- (cdr p1) (cdr p2))
          (- (cdr p1) (cdr p2)))
         )))


;; We can float common expresssion for
;; beter readbility..
;; Introducing let 

(define (euclidean2 p1 p2)
  (let
      (
       ;; note... x1-y1 is valid as symbol!
       [x1-y1 (- (car p1) (car p2))]
       ;; note... x1-y1 is valid as symbol!
       [x2-y2 (- (cdr p1) (cdr p2))]
       )
    (sqrt
     ( + (sqr x1-y1) (sqr x2-y2)))))