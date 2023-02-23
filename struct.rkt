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


;; Takes a pt3d or pt2d PT and returns a pt3d with the same coordinates.
;; If PT is a pt2d, uses 0 for z.
(define (convert-to-3d pt)
        (cond [(pt3d? pt) pt]
              [(pt2d? pt) (pt3d (pt2d-x pt) (pt2d-y pt) 0)]
              [else (error "Not a point")]))

;; Returns the 3-D (Euclidean) distance between two points.
;; If either if the points is a pt2d, assume its z-value is 0.
(define (distance raw1 raw2)
        (let ([p1 (convert-to-3d raw1)]
              [p2 (convert-to-3d raw2)])
                (sqrt (+ (expt (- (pt2d-x p1) (pt2d-x p2)) 2)
                         (expt (- (pt2d-y p1) (pt2d-y p2)) 2)
                         (expt (- (pt3d-z p1) (pt3d-z p2)) 2)))))

(distance (pt3d 1 0 0) (pt3d 0 0 0))  ; 1
(distance (pt3d 2 2 2) (pt3d 6 5 14)) ; 13
(distance (pt3d 12 21 4) (pt2d 9 21)) ; 5
(distance (pt2d 9 21) (pt3d 12 21 4)) ; 5

(define (path-length ptslist)
   (cond [(< (length ptslist) 2) 0]  ; < 2 points, no path
        ;; Otherwise, distance between first 2 points + path length of the rest
         [else (+ (distance (first ptslist) (list-ref ptslist 1))
                  (path-length (rest ptslist)))]))

(path-length (list)) ; 0
(path-length (list (pt2d 0 0))) ; 0
(path-length (list (pt2d 0 0) (pt2d 1 0))) ; 1
(path-length (list (pt2d 0 0) (pt2d 1 0) (pt3d 1 0 2))) ; 3 (+ 2)
(path-length (list (pt2d 0 0) (pt2d 1 0) (pt3d 1 0 2) (pt3d 1 2 2))) ; 5 (+ 2)
(path-length (list (pt2d 0 0) (pt2d 1 0) (pt3d 1 0 2) (pt3d 1 2 2) 
                   (pt3d 5 5 14))) ; 18 (+ 13)
(path-length (list (pt2d 0 0) (pt2d 1 0) (pt3d 1 0 2) (pt3d 1 2 2) 
                   (pt3d 5 5 14) (pt3d 5 2 10))) ; 23 (+ 5))


