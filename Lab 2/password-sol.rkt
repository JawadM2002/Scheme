(define (full-name? val)
  (and
   (list? val) ;; it is a list... not an atom
   (= (length val) 3) ;; exactly tree items.
   (not (list? (list-ref val 0))) ;; first name simple
   #t                     ;; middle name, any
   (or                    ;; last name,
    (not (list? (list-ref val 2))) ;; simple
    (not (empty? (list-ref val 2))) ;; non-empty compound
    )))
   


(define (first-name fullname)
  (first fullname))

(define (middle-name fullname)
  (first (rest fullname)))

(define (last-name fullname)
  (first (rest (rest fullname))))

(define surname last-name)

(define family-name last-name)


;; is he Highness?
(define (is-royalty? fulname)
  (and
   (list? (middle-name fulname))
   (> (length (middle-name fulname)) 2)))

(define (same-family? fulname1 fulname2)
  (equal? (surname fulname1) (surname fulname2)))

  



