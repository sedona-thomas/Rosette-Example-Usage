#lang rosette

;; Problem from http://www.cs.toronto.edu/~victorn/tutorials/sygus20/index.html

;; import library for defining holes in sketches
(require rosette/lib/synthax)

;; Original Function: polynomial
(define (poly x)
  (+ (* x x) (* 2 x) 1)) ;; x^2 + 2x + 1 = (x+1) * (x+1)

;; Target Function: factored polynomial
(define (factored x)
  (* (+ x (??)) (+ x (??))))

;; Expressing the synthesis problem
;; We want for all x integer, (poly x) = (factored x)
(define (same p f x)
  (assert (= (p x) (f x))))

;; Synthesis Problem
(define-symbolic x integer?) ;; define symbolic value "x" which represents any integer
(define solution
  (synthesize
   #:forall (list x) ;; forall x, do something
   #:guarantee (same poly factored x)))

(if (sat? solution) (print-forms solution) (print "UNSAT"))
