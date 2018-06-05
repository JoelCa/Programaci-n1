;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ej) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; Ejercicio 1

; sumanat : N -> N -> N



(define (sumanat n m) (cond [(zero? n) m]
                            [else (add1 (sumanat (sub1 n) m))]))

; Ejercicio 2

; multiplicar : N -> N -> N

(define (multiplicar n m) (cond [(zero? n) 0]
                                [else (sumanat m (multiplicar (sub1 n) m))]))

; Ejercicio 4

; intervalo-dec : N -> List N

(define (intervalo-dec n) (cond [(zero? n) empty]
                                 [else (cons n (intervalo-dec (sub1 n)))]))

; intervalo : N -> List N
(define (intervalo n) (reverse (intervalo-dec n)))

; Ejercicio 6

(define (fibnat n) (cond [(zero? n) 1]
                         [(equal? n 1) 1]
                         [else (+ (fibnat (sub1 (sub1 n))) (fibnat (sub1 n)))]))

; Ejercicio 7

(define (list-fibonacci n) (cond [(zero? n) (cons (fibnat 0) empty)]
                                 [else (cons (fibnat n) (list-fibonacci (sub1 n)))]))

; Ejercicio 10

(define ALTO 200)

(define ANCHO 200)

(define (circulos m) (cond [(zero? m) (empty-scene ANCHO ALTO)]
                           [else (place-image (circle (sqr m) "outline" "blue") (/ ANCHO 2) (/ ALTO 2)
                                              (circulos (sub1 m)))]))

(define (cuadrados m ang) (cond [(zero? m) (empty-scene ANCHO ALTO)]
                           [else (place-image (rotate ang (rectangle (sqr m) (sqr m) "outline" "blue")) (/ ANCHO 2) (/ ALTO 2)
                                              (cuadrados (sub1 m) (+ 20 ang)))]))



















