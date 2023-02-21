#lang racket

(struct pt2d (x y)
        #:transparent )  ;; #: transparent makes the struct print more transparently
;; Constructor defined for free
(pt2d 1 2)  
(define p1 (pt2d 3 4)) ;; Keep this pt2d around...

;; Type predicate defined for free
(pt2d? 5)   ;; #f
(pt2d? (pt2d -7 23)) ;; #t
(pt2d? (pt2d "baling wire" 'spit)) ;; #t   Note the loose data typing!

;; Structure invariant, which might check (for example) data types
;; of attributes, does *not* come for free.

;; Attribute accessors come for free
(pt2d-x p1)
(pt2d-y p1)

;; Equality test comes for free
;; If the struct is transparent, equal? compares attribute values
;; If the struct is opaque, just compares object identities (not too useful)
(equal? p1 (pt2d 1 2)) ;; #t
(equal? p1 (pt2d 2 2)) ;; #f
(equal? p1 (pt2d 1 3)) ;; #f

(struct pt2d-opaque (x y)) ;; Just like pt2d, but opaque
(equal? (pt2d-opaque 1 2) (pt2d-opaque 1 2)) ;; #f

;; Copy a struct
(struct-copy pt2d p1)
;; Copy with update
(struct-copy pt2d p1 [x 5])
(struct-copy pt2d p1 [x 5] [y 3]) ;; Could have just made it from scratch

;; Inheritance
(struct raven pt2d (croak)
        #:transparent)
(raven (pt2d-x p1) (pt2d-y p1) "Nevermore")
(raven 1 2 "Nevermore")
(equal? (raven (pt2d-x p1) (pt2d-y p1) "Nevermore") (raven 1 2 "Nevermore")) ;; #t


;; Add a constructor guard (like a constructor precondition)
(struct pt2d-safe (x y)
        #:transparent
        #:guard (lambda (x y type-name)
                    (if (not (and (number? x) (number? y)))
                        (error type-name "Coordinates must be numbers")
                      (values x y))))
(pt2d-safe 5 -3.3)
;(pt2d-safe "tea" 'biscuits) ;; error: coordinates aren't numbers

;; Make a function check a type and Do The Right Thing based on that
(struct pt3d pt2d (z)
            #:transparent)

(define (dist-to-0 pt)
    (cond [(pt3d? pt) (sqrt (+ (expt (pt2d-x pt) 2) (expt (pt2d-y pt) 2)
                               (expt (pt3d-z pt) 2)))]
          [(pt2d? pt) (sqrt (+ (expt (pt2d-x pt) 2) (expt (pt2d-y pt) 2)))]
          ))

(dist-to-0 p1)
(dist-to-0 (pt3d 3 4 12))