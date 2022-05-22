; defining values
(define foo 3) ; foo is defined as 3 or it can be any number
(* foo 4) ; foo is multiplied by 4 or any number

;defining functions
(define (square x) (* x x)) ; We have set the function to square x (number)
(square 4) 

(+ (square 2) (square 3)) ; Squares are added together. It can also apply for subtraction, division and multiplication

; Flow control
;(define (abs x)
 ;       (if (< x 0)
 ;       (- x)
;         x))
;(abs -3)
;(abs 3)

;Using data
; (sort (list 4 6 5)) ; This will rearrange the elements in the original order
; (length (list 1 2)) ; This will indicate how many elements are in the list

; Weird - functional list manipulation
(define my-list (list 1 2 3 4 5))
 my-list
(car my-list) ; Extracts first element
(cdr my-list) ; Gives other elements

; Weird - Recursion
(define (sum list-of-values)
  (if (= 1 (length list-of-values))
      (car list-of-values)
      (+ (car list-of-values)
       (sum (cdr list-of-values)))))
(sum (list 5 6 7)) ; Adds sums together

; Everything is generic
(sort (list (5 4 3 2 1) <)
      
      