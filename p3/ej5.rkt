;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ej5) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Ejercicio 5

(define ALTO 300) ; alto de la escena donde se dibuje el círculo
(define ANCHO 300)  ; ancho de la escena donde se dibuje el círculo


(define RADIO 50)

(define INICIAL "yellow")

; pantalla : String -> Image
(define (pantalla c) (place-image (circle RADIO "solid" c) (/ ANCHO 2) (/ ALTO 2)
                                  (empty-scene ANCHO ALTO)))

(define (cambiar-color c) (cond [(string=? c "yellow") "red"]
                                [(string=? c "red") "green"]
                                [(string=? c "green") "blue"]
                                [(string=? c "blue") "yellow"]))
              
(big-bang INICIAL                 
          [to-draw pantalla]
          [on-tick cambiar-color]
          )
