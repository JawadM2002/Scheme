;; Don't worry to understand this code.
;; Keep calm.
(define (string-indexOfN chr str n)
  (cond
    [(= (string-length str) n) n]
    [ else 
      (if (equal? (string-ref str n) chr) n
          (string-indexOfN chr str (+ n 1))
          )   ]
    )
  )
;; this function computes find() string method in Python
;; i.e. 'Rafael'.find('a') would return 1
;; In Scheme, it returns length of string if not present.
(define (string-indexOf chr str)
  (string-indexOfN chr str 0 )
  )
      
;; Start here to play with
(string-downcase "RAFAEL")
(string-append "RAFAEL" " " "MARTINEZ")
(substring "RAFAEL" 0 4)
(define nickname (substring "RAFAEL" 0 4))
(string-indexOf #\space "To be or not to be")
(string-indexOf #\b "To be or not to be")
(string-indexOf #\g "To be or not to be")
(define (email name)
  (string-downcase
   (string-append
    (substring name 0 1)
    (substring
     name
     (+ (string-indexOf #\space name) 1)
     (string-length name)
     )
    "@gre.ac.uk")))