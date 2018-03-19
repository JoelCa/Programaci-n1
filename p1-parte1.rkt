#lang racket
(define PC 18)
(define PL 2)

(define (clasificar x y z)
  (define (equilatero x y z) (= x y z 60))
  (define (isoceles x y z) (or (and (= x y) (not (= x z)))
                               (and (= x z) (not (= x y)))
                               (and (= z y) (not (= x z)))))
  (define (escaleno x y z) (and (not (= x y)) (not (= x z)) (not (= y z))))
  (if (equilatero x y z) "equilatero"
      (if (isoceles x y z) "isoceles"
          (if (escaleno x y z) "escaleno"
              "error"))))

;; (define (monto c l) (() + ()))