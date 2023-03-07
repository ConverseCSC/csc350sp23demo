#lang racket

(define (fibonacci n) 
    (cond [(< n 2) n] 
          [else (first (real-fib n))]))

(define (real-fib n) 
    (cond [(< n 2) (list n 0)] ; base case
          [else (let ((prev-fib (real-fib (- n 1)))) 
                     (list (+ (first prev-fib) (second prev-fib)) 
                           (first prev-fib)))]))

(fibonacci 4)
(fibonacci 6)
(real-fib 6)