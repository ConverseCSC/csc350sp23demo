#lang racket

;#lang reader lib/htdp-beginner-reader

;#lang racket/base

; Add the math stuff
;(require racket/math)

;; Numbers and their operations
(+ 2 2)
(/ 1 3)
(* 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10)
(- (- 1 1) 1) ; == -1
(- 1 (- 1 1)) ; == 1
(- 1 (- 1 (- 1 1) 2) 3 (- 2 2) 5) ; (- 1 (- 1 0 2) 3 0 5) == (- 1 -1 3 0 5) == -6

(/ (* (sin (/ pi 2)) (cos pi)) (cos (/ pi 3))) 

;; String operations
(string-append "Hel" "lo, w" "orld!")
(string-length (string-append "Hel" "lo, w" "orld!"))
;(string-ith (string-append "Hel" "lo, w" "orld!") (- 1 (- 1 1)))

;; Type-checking functions
(string? "Hello, world!")
(string? 54)
(number? "Hello, world!")
(number? (sin (/ pi 2)))

;; Creating constants
(define STATES 50)
(symbol? STATES) ; no, it's a variable, and its value is a number

;; Symbols
(define STATES2 'united)
(symbol? 'united)
(symbol=? STATES2 'united)

;; Boolean functions 
(and (> STATES 49) (< STATES 51))

;; Temperature converter
(define (f->c deg-f)
    (* (/ 5 9) (- deg-f 32)))

(f->c 32) ;; 0
(f->c 212) ;; 100
(f->c 98.6) ;; 37
(f->c -40) ;; -40