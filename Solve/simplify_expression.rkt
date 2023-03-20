#lang rosette
(require rosette/lib/synthax)

;; Can be replaced with any expression
;; Can also be used to check if expression is unsatifiable
(define (expression x)
    (+ (* 3 x) 2))

;; Solves an expression
(define-symbolic x integer?)
(solve (assert (= (expression x) 5)))