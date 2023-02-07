#lang racket

;#lang reader lib/htdp-beginner-reader

;#lang racket/base

; Add the math stuff
;(require racket/math)

(+ 2 2)
(/ 1 3)
(* 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10)
(- (- 1 1) 1) ; == -1
(- 1 (- 1 1)) ; == 1
(- 1 (- 1 (- 1 1) 2) 3 (- 2 2) 5) ; (- 1 (- 1 0 2) 3 0 5) == (- 1 -1 3 0 5) == -6

(/ (* (sin (/ pi 2)) (cos pi)) (cos (/ pi 3))) 

(string-append "Hel" "lo, w" "orld!")
(string-length (string-append "Hel" "lo, w" "orld!"))
;(string-ith (string-append "Hel" "lo, w" "orld!") (- 1 (- 1 1)))

(define (fibonacci n) 
    (cond ((< n 2) n) 
            (else (first (real-fib n)))))

(define (real-fib n) 
    (cond ((< n 2) (list n 0)) 
           (else (let ((prev-fib (real-fib (- n 1)))) 
             (list (+ (first prev-fib) (second prev-fib)) 
                (first prev-fib))))))

(fibonacci 4)