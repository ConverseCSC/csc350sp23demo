#lang racket

(= 1/2 .5) ; #t, OK
(= 1/10 .1) ; #f, oops

;; Square brackets indicate an optional argument
;; and its default value
(define (fp=? x y [epsilon 0.000001])
    ;; Let epsilon = 10 ** -6
    (< (abs (- x y)) epsilon))

(= (expt 1/10 2) (expt .1 2)) ; #f, as expected

(fp=? (expt 1/10 2) (expt .1 2)) ; #t
(fp=? (expt 1/10 2) (expt .1 2) 0.0000000000000000001) ; #f, because epsilon is tiny

;; Same function, but defined using lambda notation
;; Done this way, it works exactly like defining a constant,
;;   except that the value of the constant is a function.
;;   (The result of evaluating the lambda is the function, which
;;   is then attached to the name.  After that, the name can be
;;   used to call the function in the usual way.)
(define fp=
        (lambda (x y [epsilon 0.000001])
            (< (abs (- x y)) epsilon)))

(fp= (expt 1/10 2) (expt .1 2))

;; Use of let to answer one of the homework questions (from HW1)
(define (profit viewers)
    (let ([revenue (* 5 viewers)]
          [cost (+ 20 (* .5 viewers))])
      (- revenue cost)))

(profit 4)
(profit 5)

(expt 
    (begin  ; sequencing.  Returns the value from the last expression.
        (profit 4)
        (profit 20) ; never see this one
        (profit 5)) ; "begin" returns this value
    3)

(expt 
    (begin0  ; sequencing.  Returns the value from the last expression.
        (profit 4)  ; "begin0" returns this value
        (profit 20) ; never see this one
        (profit 5))
    3)

;; if with no else.  No effect if the condition is false.
(when (= (remainder 2023 4) 0)
    "Maybe a leap year?")

;; Like when, but negated.  No effect if the condition is true.
(unless (= (remainder 2023 4) 0)
    "Not a leap year")