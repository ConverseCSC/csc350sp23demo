#lang racket

;# def gcd(m: int, n: int) -> int:
;#     while n != 0:
;#        m, n = n, m % n
;#     return m

;; Indefinite loop.  The base case is the negation of the loop condition.
(define (gcd m n)
    (cond [(= n 0) m]
          [else (gcd n (remainder m n))]))

(gcd 3 3)
(gcd 1 0)
(gcd 0 1)
(gcd 270 81) ; gcd (* 3 3 3 5 2) (* 3 3 3 3)
