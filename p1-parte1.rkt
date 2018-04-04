#lang racket

; Ejercicio 3
(define (ej3 x y z)
  (define (equilatero x y z) (= x y z 60))
  (define (isosceles x y z) (or (and (= x y) (not (= x z)))
                               (and (= x z) (not (= x y)))
                               (and (= z y) (not (= x z)))))
  (define (escaleno x y z) (and (not (= x y)) (not (= x z)) (not (= y z))))
  (if (equilatero x y z) "equilatero"
      (if (isosceles x y z) "isoceles"
          (if (escaleno x y z) "escaleno"
              "error"))))

(define (precioConDescuento p d) (- p (/ (* p d) 100)))

; Ejercicio 5
(define PC 18)

(define PL 2)

; El 15% de descuento se realiza sobre los lapices.
; Mientras que el 10% de descuento se realiza sobre los cuadernos.
(define (ej5 c l) (+ (if (>= l 5) (precioConDescuento (* l PL) 15) (* l PL))
                     (if (>= c 4) (precioConDescuento (* c PC) 10) (* c PC))))

; Ejercicio 6
(define (ej6 c l) (min (if (>= (+ c l) 10) (precioConDescuento (+ (* c PC) (* l PL)) 18) (+ (* c PC) (* l PL)))
                       (+ (if (>= l 5) (precioConDescuento (* l PL) 15) (* l PL))
                          (if (>= c 4) (precioConDescuento (* c PC) 10) (* c PC)))))

; Ejecicio 7
(define (pitagórica? x y z)
  (define (prop a b c) (= (sqr c) (+ (sqr a) (sqr b))))
  (if (prop x y z) #t (if (prop x z y) #t (prop z y x))))

; Ejercicio 8
(define (ej8 x y z) (if (pitagórica? x y z)
                        (string-append "Los números "
                                       (number->string x)
                                       ", "
                                       (number->string y)
                                       " y "
                                       (number->string z)
                                       " forman una terna pitagórica.")
                        (string-append "Los números "
                                       (number->string x)
                                       ", "
                                       (number->string y)
                                       " y "
                                       (number->string z)
                                       " no forman una terna pitagórica.")
                        ))

; Banderas
(require 2htdp/image)

(define ANCHO 180)

(define ALTURA 120)

(define ejemplo (place-image (rectangle 90 30 "solid" "red") 45 15
                             (place-image (circle 10 "solid" "blue") 45 45
                                          (empty-scene 90 60))))

; Ejercicio a
(define perú (place-image (rectangle (/ ANCHO 3) ALTURA "solid" "red") (/ ANCHO 3 2) (/ ALTURA 2)
                          (place-image (rectangle (/ ANCHO 3) ALTURA "solid" "white") (/ ANCHO 2) (/ ALTURA 2)
                                       (place-image (rectangle (/ ANCHO 3) ALTURA "solid" "red") (* ANCHO 5/6)  (/ ALTURA 2)
                                                    (empty-scene ANCHO ALTURA)))))

; Ejercicio b
(define italia (place-image (rectangle 30 60 "solid" "green") 15 30
                            (place-image (rectangle 30 60 "solid" "white") 45 30
                                         (place-image (rectangle 30 60 "solid" "red") 75 30
                                                      (empty-scene 90 60)))))

; Ejercicio c
(define (bandera-vertical a b c)
  (place-image (rectangle (/ ANCHO 3) ALTURA "solid" a) (/ ANCHO 3 2) (/ ALTURA 2)
               (place-image (rectangle (/ ANCHO 3) ALTURA "solid" b) (/ ANCHO 2) (/ ALTURA 2)
                            (place-image (rectangle (/ ANCHO 3) ALTURA "solid" c) (* ANCHO 5/6)  (/ ALTURA 2)
                                         (empty-scene ANCHO ALTURA)))))

; Ejecicio f
(define (bandera-horizontal a b c) (place-image (rectangle ANCHO (/ ALTURA 3) "solid" a) (/ ANCHO 2) (/ ALTURA 3 2)
                                                (place-image (rectangle ANCHO (/ ALTURA 3) "solid" b) (/ ANCHO 2) (/ ALTURA 2)
                                                             (place-image (rectangle ANCHO (/ ALTURA 3) "solid" c) (/ ANCHO 2) (* ALTURA 5/6)
                                                                          (empty-scene ANCHO ALTURA)))))

; Ejercicio g
(define (bandera-bandas sentido a b c) (if (equal? sentido "vertical")
                                           (bandera-vertical a b c)
                                           (if (equal? sentido "horizontal")
                                               (bandera-horizontal a b c)
                                               (error "sentido"))))


; Ejercicio i
(define sudan (place-image (rotate 270 (triangle ALTURA "solid" "green")) (* ALTURA (/ (sqrt 3) 4)) (/ ALTURA 2)
                           (bandera-bandas "horizontal" "red" "white" "black")))

(define argentina (place-image (circle (/ ALTURA 3 2 6/5) "solid" "yellow") (/ ANCHO 2) (/ ALTURA 2)
                               (bandera-bandas "horizontal" "blue" "white" "blue")))

(define camerún (place-image (star (/ ALTURA 3 2) "solid" "yellow") (/ ANCHO 2) (/ ALTURA 2)
                             (bandera-bandas "vertical" "green" "red" "yellow")))

; Ejecicio j
(define brasil (place-image (circle (/ ALTURA 5) "solid" "blue") (/ ANCHO 2) (/ ALTURA 2)
                            (place-image (rhombus (/ ALTURA 1.4) 120 "solid" "yellow") (/ ANCHO 2) (/ ALTURA 2)
                                         (place-image (rectangle ANCHO ALTURA "solid" "green") (/ ANCHO 2) (/ ALTURA 2)
                                                      (empty-scene ANCHO ALTURA)))))









