#lang rosette
(require rosette/lib/synthax)

;; tried to make verify work but struggled with the syntax
;; tried using this example as a reference and it didnt help: https://github.com/racket-templates/rosette-template/blob/master/verify.rkt


;; example of problem that is solved by counterexample here: https://www.khanacademy.org/test-prep/praxis-math/praxis-math-lessons/praxis-math-number-and-quantity/a/gtp--praxis-math--article--counterexamples--lesson
;; "All even numbers are multiples of 4."

(define-symbolic x integer?)

(define (isEven x)
    (= 0 (modulo x 2)))

(define (isMultipleOfFour x)
    (= 0 (modulo x 4)))

(verify (assert (= (isEven x) (isMultipleOfFour x))))