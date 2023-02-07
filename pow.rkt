#lang racket

; Scheme function for raising a number to the power of another number
; Definite loop
(define (pow a b)
    ;; b >= 0
    (cond [(= b 0) 1]
          [else (* a (pow a (- b 1)))]))

(pow 2 3)
(pow 2 4)
(pow 2 5)
(pow 3 2)
(pow 3 3)
(pow 3 4)
(pow 3 5)
