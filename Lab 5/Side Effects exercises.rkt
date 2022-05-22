(string-append "Hello" "World!")
(string? (string-append "Hello" "World!"))

(display (string-append "Hello" "World!"))
(void? (display (string-append "Hello" "World!")))

(read)
(number? (read))

(read)
(string? (read))

(read)
(symbol? (read))

(define x 1) (define y 9)
(set! x (+ x (read)))
(set! y (+ x (read)))

(define (io-loop)
  (begin
    (define in null)
    (if (equal? in 'q)
        (void)
        (begin
          (display (format "you typed : ~a~n" in))
          (io-loop)))))

(define (io-map)
  (begin
    (map
     (lambda (u) (* u 2))
     (read))))