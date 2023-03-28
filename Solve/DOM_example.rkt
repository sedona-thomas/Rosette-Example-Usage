#lang rosette
(require rosette/lib/synthax)

; attempting to use the DOM example from "Growing Solver-Aided Languages with ROSETTE"
; to learn how to use structs in Rosette

(struct DOM (tagname attributes content) #:transparent)

(define (zpath? zpath source sink)
  (or (and (equal? source sink)
  (andmap (curry equal? "") zpath))
  (and (DOM? source)
  (not (null? zpath))
  (equal? (car zpath) (DOM-tagname source))
  (ormap (lambda (child)
  (zpath? (cdr zpath) child sink))
  (DOM-content source)))))

(define dom
  (DOM "[document]" '()
    '(,(DOM "html" '()
      '(,(DOM "body" '() 
        '(,(DOM "ul" '()
          '(,(DOM "li[0]" '()
            '("Hello"))
          ,(DOM "li[1]" '()
            '("World")))))))))))

(define-symbolic z0 z1 z2 z3 z4 string?)
(define zp (list z0 z1 z2 z3 z4))
(evaluate zp (solve (assert (zpath? zp dom "World"))))


(define-symbolic zp0 zp1 mask string?)
(define model
  (solve
   (begin (assert (zpath? zp0 dom "World"))
          (assert (zpath? zp1 dom "Hello")))))
; returns that string? is not a solvable type


; Rosette doesn't recognize the generalize function
;(generalize 
;  (evaluate mask model)
;  (evaluate zp0 model) 
;  (evaluate zp1 model))
