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
    (list 1 "two" 3 (list 4 5) "six" (cons 7 (list (cons 8 empty) 9))))

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

;; len: take a list and return its length
(define (len listvar)
    (cond [(empty? listvar) 0]
          [else (+ 1 (len (rest listvar)))]))

(len (sample-list)) ;; 6

(define (deeplen listvar)
    (cond [(empty? listvar) 0]
          [(list? (first listvar)) (+ (deeplen (first listvar))
                                      (deeplen (rest listvar)))]
          [else (+ 1 (deeplen (rest listvar)))]))

(deeplen (sample-list)) ; 9

(define (count-symbols-rec listvar)
    (cond [(empty? listvar) 0]
          [(symbol? (first listvar)) (+ 1 (count-symbols-rec (rest listvar)))]
          [else (count-symbols-rec (rest listvar))]))

(define symb-list (list #t 'foo '('xyzzy 'plugh) 'bar pi 'baz "not a symbol" 5103))
(count-symbols-rec symb-list) ; 3

(define (count-symbols-filter listvar)
    (length (filter symbol? listvar)))

(count-symbols-filter symb-list) ; 3

;; Takes a list, which may contain strings.  Returns a string that is the 
;; concatenation of all the strings on the list.
(define (string-cat listvar)
    (cond [(empty? listvar) ""]
          [(string? (first listvar)) (string-append (first listvar)
                                                    (string-cat (rest listvar)))]
          [else (string-cat (rest listvar))]))

(string-cat (sample-list))  ; "twosix"
(string-cat symb-list)      ; "not a symbol"
(string-cat (list))         ; ""