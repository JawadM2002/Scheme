;; Inventory.

;; An inventory is a list of triples, as in
;; 
(define inventory '( (prod1 1 15) (prod2 2 1) (prod3 10 5)))
;; where
;; first element is a symbol
;; second element is a integer, number of items
;; third element is an integer, price of product
;; (prod1 - product
;;  1     - number of items
;;  15    - price



;; P: True (any thing accepted)
;; Q: value fulfiling definition above
(define (inventory? inv)
  (and
   (list? inv)  ;; it is a list
   (andmap      ;; for all members...
    (lambda (u) (and
                 (list? u)
                 (= (length u)3)   ;; has length 3
                 (symbol? (first u))  ;; first symbol
                 (integer? (second u))  ;; second integer
                 (integer? (third u))))
    inv )))



;; Total amount of items
;; P: Posibly empty inv
(define (total-items inv)
  (apply
   +
   ;; Think two stages
   (map
    (lambda (u) (second u))
    inv)))


;; Value of inventory.
;; P :inventory, possbly empty.
(define (total-value inv)
  (apply
   + ;;
   (map
    (lambda (u) (* (second u) (third u))) ;; makes product
    inv)))
   


;; Other version, with foldl
;; P: empty
(define (total-value inv)
  (foldl
   (lambda (u acum) (+ (* (second u)(third u)) acum))
   0
   inv))



;; Average value of an item.
(define (average-value inv)
  (let
      ([ my-total (total-items inv)]
       [ my-value (total-value inv)])
    (/ my-value my-total)))


;; list->list
;; compute vat for each product
(define (vat inv)
  (map
   (lambda (u) (list (first u)(* (third u) 0.14)))
   inv))


(define (final-price inv)
  (map
   (lambda (u) (list (first u)(* (third u) 1.14)))
   inv))

;; filter those items under stock 20
;; we just want the item
;; P ; inventort
(define (low-stock inv quantity)
  (map
   (lambda (u) (first u)) ;; extract only the symbol
   
   (filter
    (lambda (u) (< (third u) quantity))
    inv)))


;; another watm floating complex expressions
;; filter those items under stock 20
;; we just want the item
(define (low-stock2 inv quantity)
  (let
      (
       [my-filter  (filter
                    (lambda (u) (< (third u) quantity))
                    inv)]
       )
    (map
     (lambda (u) (first u)) ;; extract only the symbol
     my-filter)))
    



;; P non-empty inv
(define (cheapest-item2 inv)
  (first ;; we just want the symbol
   
   (foldl
    (lambda (u acum) (if (< (third u) (third acum))
                         u
                         acum))  ;; this a modified version of max.
    (first inv)
    (rest inv) ;; the rest
    )))


   
  
  
  

  