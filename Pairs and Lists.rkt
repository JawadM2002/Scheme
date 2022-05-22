; Pairs
(cons 1 2)
(cons (cons 1 2) 3)
(define foo (cons 1 2))

foo
(car foo)
(cdr foo)

; Lists
(cons 1 null)
(define bar (cons 1 null))

bar
(car bar)

(cons 1 (cons 2 null))
(cons 1 (cons 2 (cons 3 null)))
(define mylist (cons 1 (cons 2 (cons 3 null))))
mylist
(car mylist)
(cdr mylist)
(cadr mylist) ; cadr gets the element based on second cons function
(caddr mylist) ; caadr gets the element based on third cons function
; each d in car will get the elements based on how many cons functions there is
(equal? (list 1 2 3) mylist) ; #t is if the function has been defined with the elements
(list-ref (list "a" "b" "c") 1) ; list-ref will get the element based on
; the id number e.g. 0, 1, 2

; Loops - how we can implement list-ref
(define (my-list-ref lst n)
        (if (zero? n)
        (car lst)
        (my-list-ref (list "a" "b" "c") 1)))

; Maps
(define baz (list 1 2 3))
(define (double x) (* x 2)) 
(map double baz) ; doubles the baz function
(define (double-all x) (map double x))
(double-all baz)

; How we implement maps
(define (my-map fn lst)
  (if (null? lst)
      null
      (cons (fn (car lst)) (my-map fn (cdr lst)))))
(my-map double baz)

; Fold
(define qu (list 1 2 3 4))
(foldr + 0 qu) ; folds the elements together then added
(foldr * 0 qu) ; multiplies list items

; How to implement Fold
(define (my-foldr fn start lst)
  (if (null? lst)
      start
      (fn (car lst) (my-foldr fn start (cdr lst)))))
(my-foldr + 0 qu)
(my-foldr * 3 qu)