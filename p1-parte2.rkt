;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname p1-parte2) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; Ejercicio 2
(define (clasificación-imagen img) (cond [(> (image-width img) (image-height img)) "Gorda"]
                                         [(< (image-width img) (image-height img)) "Flaca"]
                                         [(= (image-width img) (image-height img)) "Cuadrada"]))

(define (clasificación-triangulo x y z) (if (= (+ x y z) 180)
                                            (cond [(= x y z 60) "Triangulo equilatero."]
                                                  [(or (= x y) (= y z) (= x z)) "Triangulo isoceles." ]
                                                  [(and (not (= x y)) (not (= x z)) (not (= y z))) "Triangulo escaleno."])
                                            "Los ángulos no corresponden a triangulo."))

(define PC 18)

(define PL 2)

(define (precio-con-descuento x p c d) (cond [(>= x c) (- p (/ (* d p) 100))]
                                             [(< x c) p]))

(define (precio c l) (min (+ (precio-con-descuento l (* l PL) 5 15) (precio-con-descuento c (* c PC) 4 10))
                          (precio-con-descuento (+ c l) (+ (* c  PC) (* l PL)) 10 18)))

(define (es-pitagorica a b c) (= (sqr c) (+ (sqr a) (sqr b))))
  
(define (pitagorica? x y z)
  (cond [(es-pitagorica x y z) #t]
        [(es-pitagorica z y x) #t]
        [(es-pitagorica x z y) #t]
        [(not (or (es-pitagorica x y z)
                  (es-pitagorica z y x)
                  (es-pitagorica x z y))) #f]))

; Ejericicio 9

(define (sgn-number x) (cond [(< x 0) -1]
                             [(= x 0) 0]
                             [(> x 0) 1]))

(define (sgn-boolean x) (cond [(boolean=? x #t) 1]
                              [(boolean=? x #f) 0]))

(define (sgn-img x) (cond [(string=? (clasificación-imagen x) "Flaca") -1]
                          [(string=? (clasificación-imagen x) "Gorda") 1]
                          [(string=? (clasificación-imagen x) "Cuadrada") 0]))
(define (sgn-ej9 x)
  (cond [(number? x) (sgn-number x)]
        [(and (string? x) (number? (string->number x))) (sgn-number (string->number x))]
        [(and (string? x) (not (number? (string->number x)))) "La cadena no se puede convertir a un número." ]
        [(boolean? x) (sgn-boolean x)]
        [(image? x) (sgn-img x)]
        [(not (or (number? x)
                  (string? x)
                  (boolean? x)
                  (image? x))) "Clase no soportada por la función."]))





