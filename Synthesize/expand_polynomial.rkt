#lang rosette
(require rosette/lib/synthax)

;; Original Function: factored polynomial
(define (factored-polynomial x)
  (* (+ x 1) (+ x 1))) ;; x * (x+1) * (x+1) = x^2 + 2x + 1

;; Sketch Function: expended polynomial
(define (expanded-polynomial x)
  (+ (* (??) x x) (* (??) x) (??))) 

(define (same p f x)
  (assert (= (p x) (f x))))

;; Synthesis Problem
(define-symbolic x integer?)
(define solution
  (synthesize
   #:forall (list x) ;; forall x, do something
   #:guarantee (same factored-polynomial expanded-polynomial x)))

(if (sat? solution) (print-forms solution) (print "UNSAT"))
