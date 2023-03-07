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

;; Fahrenheit to Celsius in a list.
(define (F->C degF)
    (* (/ 5 9) (- degF 32)))
(F->C 32)
(F->C 212)
(F->C -40)

;; Using recursion:
(define (listF->listC listF)
    (cond [(empty? listF) empty]
          [else (cons (F->C (first listF)) 
                      (listF->listC (rest listF)))]))

(listF->listC (list 212 98.6 32 -40))

;; Using map
(map F->C (list 212 98.6 32 -40))

;; Filtering out expensive items (above a given threshold)
;; Recursively:
(define (eliminate-exp ua lotp)
    (cond [(empty? lotp) empty] ; Base case
          ;; Two recursive cases: (1) keep the first toy, (2) don't keep the first toy
          [(>= ua (first lotp)) (cons (first lotp) (eliminate-exp ua (rest lotp)))]
          [else (eliminate-exp ua (rest lotp))]))

(eliminate-exp 1.0 (list 2.95 .95 1.0 5))

;; Using filter
(define (filter-exp ua lotp)
    (filter 
        (lambda (price) (>= ua price)) ;; Closure: value of ua is baked in, or "closed over"
        lotp))

(filter-exp 1.0 (list 2.95 .95 1.0 5))

;; Inventory-record structure.  An inventory is a list of these things.
(struct inv-rec (name price) #:transparent)

;; Recursively
(define (extract>1 inventory)
    (cond [(empty? inventory) empty] ;; Base case
          ;; Two recursive cases: (1) keep the first item, (2) don't keep the first item
          [(> (inv-rec-price (first inventory)) 1) (cons (first inventory)
                                                         (extract>1 (rest inventory)))]
          [else (extract>1 (rest inventory))]))

(extract>1 (list (inv-rec 'dagger .95)
                 (inv-rec 'Barbie 17.95)
                 (inv-rec 'key-chain .55)
                 (inv-rec 'robot 22.05)))

;; Using filter
(define (filter>1 inventory)
    (filter 
        (lambda (record) (> (inv-rec-price record) 1)) 
        inventory))
(filter>1 (list (inv-rec 'dagger .95)
                (inv-rec 'Barbie 17.95)
                (inv-rec 'key-chain .55)
                (inv-rec 'robot 22.05)))

;; Is there an inventory structure in the list?
;; Recursively
(define (inv-present? listvar)
    (cond [(empty? listvar) #f]
          [(inv-rec? (first listvar)) #t]
          [else (inv-present? (rest listvar))]))

(inv-present? symb-list)
(inv-present? (list #t 'foo '('xyzzy 'plugh) 'bar pi 'baz "not a symbol" 5103
                    (inv-rec 'Barbie 17.95)))

(define (inv-present-filter? listvar)
    (> (length (filter inv-rec? listvar)) 0))

(inv-present-filter? symb-list)
(inv-present-filter? (list #t 'foo '('xyzzy 'plugh) 'bar pi 'baz "not a symbol" 5103
                          (inv-rec 'Barbie 17.95)))

;; phone record
(struct phone-rec (name number))
;; A phonebook is a list of phone records

(define (whose-number number phonebook)
    (cond [(empty? phonebook) ""]
          [(string=? (phone-rec-number (first phonebook)) number)
             (phone-rec-name (first phonebook))]
          [else (whose-number number (rest phonebook))]))

(whose-number "596-9156" (list (phone-rec "Peter Brown" "596-9156")
                               (phone-rec "Switchboard" "596-9000")))
(whose-number "596-9155" (list (phone-rec "Peter Brown" "596-9156")
                               (phone-rec "Switchboard" "596-9000")))

