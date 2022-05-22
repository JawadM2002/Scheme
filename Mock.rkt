;; Question 43
"Oh, my!"
'foo'
'Cheddar-cheese'
"42"
;; Question 37
(define lst '(Adam (Bob Gill) Tom Zoe))
(car (cadr lst)) 

;; Question 38
(cons 'X '(a b c d))
(cons'(a b c d)'X)
(cons ' X (reverse '(a b c d )))
(reverse (cons 'X (reverse '(a b c d)))) ;; Correct

;; Question 47
(cons (cdr '(A B)) (car '(C D)))

;; Question 48
(define scores '((10 5) (8 3) (10 10)))
(map + (map car scores) (map cadr scores))

;; Question 49
(cdr (list (- 6 5) 1 (car '(2 3 4)) (/ 9 3) 4))

;; Question 50
(car (cdr (list (+ 2 6) (* 3 5) 9)))