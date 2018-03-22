#lang racket

;; Pruebas
(require 2htdp/image)
;; (circle 30 "outline" "red")

(define PUNTOROJO (circle 3 "solid" "red"))
(define (cuadAzul x) (square x "solid" "blue"))

(define (fib n)
  (cond [(= n 0) 0]
        [(= n 1) 1]
        [else (+ (fib (- n 1))
                 (fib (- n 2)))]))

(define (hola x)
  (let ([x ((lambda (a) a) 10)])
    (define (ff w) x)
  (ff x)))

;; Ejercicio 8
(define (posible? x y z)
  (define (prop a b c) (> (+ a b) c))
  (and (prop x y z)
       (prop x z y)
       (prop y z x)))

;; Ejercicio 9
(define (pitagórica? x y z)
  (define (prop a b c) (= (sqr c) (+ (sqr a) (sqr b))))
  (or (prop x y z)
      (prop x z y)
      (prop z y x)))

;; Ejercicio 10
(define (comienzaA? s)
  (equal? (substring s 0 1) "A"))

;; Ejercicio 11
(define (poner- s i) (string-append (substring s 0 i) "-" (substring s i (string-length s))))