;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ej) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; Práctica 6

; Ejercicio 1

; sumanat : N -> N -> N

(define (sumanat n m) (cond [(zero? n) m]
                            [else (add1 (sumanat (sub1 n) m))]))

; Ejercicio 2

; multiplicar : N -> N -> N

(define (multiplicar n m) (cond [(zero? n) 0]
                                [else (sumanat m (multiplicar (sub1 n) m))]))

; Ejercicio 6

; intervalo-dec : N -> List N

(define (intervalo-dec n) (cond [(zero? n) empty]
                                 [else (cons n (intervalo-dec (sub1 n)))]))

; intervalo : N -> List N
(define (intervalo n) (reverse (intervalo-dec n)))

; Ejercicio 8

(define (fibnat n) (cond [(zero? n) 1]
                         [(equal? n 1) 1]
                         [else (+ (fibnat (sub1 (sub1 n))) (fibnat (sub1 n)))]))

; Ejercicio 9

(define (list-fibonacci n) (cond [(zero? n) (cons (fibnat 0) empty)]
                                 [else (cons (fibnat n) (list-fibonacci (sub1 n)))]))

; Ejercicio 13

(define ALTO 200)

(define ANCHO 200)

(define (circulos m) (cond [(zero? m) (empty-scene ANCHO ALTO)]
                           [else (place-image (circle (sqr m) "outline" "blue") (/ ANCHO 2) (/ ALTO 2)
                                              (circulos (sub1 m)))]))

(define (cuadrados m ang) (cond [(zero? m) (empty-scene ANCHO ALTO)]
                                [else (place-image (rotate ang (rectangle (sqr m) (sqr m) "outline" "blue")) (/ ANCHO 2) (/ ALTO 2)
                                              (cuadrados (sub1 m) (+ 20 ang)))]))

; Ejercicio 14
(define (cuotas-aux j total n i) (cond [(zero? j) '()]
                                       [else (cons (+ (/ total n)
                                                      (* (/ total n)
                                                         (* (/ i 1200) j)))
                                                   (cuotas-aux (sub1 j) total n i))]))
(check-expect (cuotas 30000 3 12)
              (list 10100 10200 10300))

(define (cuotas total n i) (reverse (cuotas-aux n total n i)))

















