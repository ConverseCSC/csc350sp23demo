#lang racket

;; Two ways to make a list
;;; with (list) function:
(list)
(list "a" "b" "c" 1 2 3)
;;; with (cons):
(cons 1 empty)

;; Lists are heterogeneous.  They can even contain other lists.
(list 1 2 3 (list 4 5) "six" (cons 7 (list (cons 8 empty) 9)))

;; Function, so I don't have to retype the silly list repeatedly
(define (sample-list)
    (list 1 2 3 (list 4 5) "six" (cons 7 (list (cons 8 empty) 9))))

;; Other list operations
(length (sample-list))
(list-ref (sample-list) 3)
(member 3 (sample-list))


;; map
(define (first-val value)
    (cond [(list? value) (first value)]
          [else value]))

(map first-val (sample-list))

(define (double x)
    (* 2 x))
(map double (list 1 2 3 4 5 6))

;; filter
(filter list? (sample-list))