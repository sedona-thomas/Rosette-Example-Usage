#lang rosette
(require rosette/lib/synthax)

;; Original Function: messy arithmatic expression with + - * /
(define (expression x)
    (+ (* 3 x) 10 7 8 9 x))

;; Sketch Function: simplified expression
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
