#lang rosette
(require rosette/lib/synthax)

;; Was trying to take a messy expression like  x + 1 + x + 2 + x - 1 + (5*4) + x/8 + 4x - x 
;; to simplyfy into "(a/b)x + c" form
;; rosette apparently cannot handle certain patterns of holes (??) in arithmatic expressions
;; I'm pretty sure the issue is that there are too many nested holes, 
;; but the examples I found of the error message said it was due to unnecessary parentheses

;; Original Function: messy arithmatic expression with + - * /
(define (expression x)
    (+ (* 3 x)))

;; Sketch Function: simplified expression
;; rosette cannot handle an expression with two holes (??)
;; ex. cannot handle: "(/ (* x (??)) (??))" or "(* x (/ (??) (??)))"
;; tried using rational numbers but it will not accept rational numbers when it expects a solvable data type
(define (simplified-expression x) 
  (+ (/ (* x (??)) (??)) (??)))
;; (+ (* x (??) (/ 1 (??))) (??))) also doesnt work

(define (same f1 f2 x)
  (assert (= (f1 x) (f2 x))))

;; Synthesis Problem
(define-symbolic x rational?)
(define solution
  (synthesize
   #:forall (list x) ;; forall x, do something
   #:guarantee (same expression simplified-expression x)))

(if (sat? solution) (print-forms solution) (print "UNSAT"))
