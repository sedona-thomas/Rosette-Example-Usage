#lang rosette
(require rosette/lib/synthax)

;; Original Function: messy arithmatic expression with + - * /
(define (expression x)
    (+ (* 3 x) 10 7 8 9 x))

;; Sketch Function: simplified expression
;; rosette cannot handle an expression with two holes (??)
;; ex. cannot handle: "(/ (* x (??)) (??))" or "(* x (/ (??) (??)))"
;; tried using rational numbers but it will not accept rational numbers when it expects a solvable data type
(define (simplified-expression x) 
  (+ (* x (??)) (??)))

(define (same f1 f2 x)
  (assert (= (f1 x) (f2 x))))

;; Synthesis Problem
(define-symbolic x integer?)
(define solution
  (synthesize
   #:forall (list x) ;; forall x, do something
   #:guarantee (same expression simplified-expression x)))

(if (sat? solution) (print-forms solution) (print "UNSAT"))
