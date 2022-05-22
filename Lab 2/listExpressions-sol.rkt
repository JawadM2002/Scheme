;; list-expressions
(list 1 2 (list "wine" "bear"))

;; We define a new symbol to avoid typing
(define my-list (list 1 2 (list "wine" "bear")))

;; length of outer list
(length my-list)

;; length of inner list
(length (list-ref my-list 2))

;; length of first string in the inner list
(let
    ;; locally definition
    ([nested-list (list-ref my-list 2)])
  
  (string-length (list-ref nested-list 0)))

;; Access to second element
(first (rest my-list))
(car (cdr my-list))

;; Access to inner list
(first (rest (rest my-list)))

(car (cdr (cdr my-list)))
(caddr my-list)