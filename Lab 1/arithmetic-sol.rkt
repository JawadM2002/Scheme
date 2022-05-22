;; Translate these two functions into Scheme.
;;
;; Then call it as in
;; (prime 5)
;; (prime 11)


;; This is what we call Immersive Function.
;; You will learn later.
;;def primeG(n,N):
;;    if (n==N):
;;       return True
;;    else:
;;        if (N%n == 0):
;;            return False
;;        else:
;;            return primeG(n+1,N)
;;def prime(N):
;;    #We call this initial call to auxiliary function.
;;    return primeG(2,N)

;; 15 % 3
(modulo 15 3)
;;(7 + 2 ) // 4
(quotient (+ 7 2) 4)
;; (15 % 3 ) == 0 Check if 3 is divisor of 15.
(= (modulo 15 3) 0)

(modulo 15 3)
(quotient (+ 7 2) 4)
(= 0 (modulo 15 3))

;; n 2 in first call
;; N >= n
(define (primeG n N)
  (cond
    [(= n N) #t]
    [(= (modulo N n) 0) #f]
    [else (primeG (+ n 1) N)]
    )
  )

(define (prime n)
  (primeG 2 n)
  )
;; (prime 11)
;; (prime 15)