;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname p3) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Práctica 3.

; Ejecicio 3

; El estado del sistema será un número, que representa la longitud del radio de un círculo azul,
; a dibujarse en el centro de una escena.

; pantalla : Number -> Image
; transforma el estado del sistema en una imagen a mostrar a través de la cláusula to-draw
(define (pantalla n) (place-image (circle n "solid" "blue") 150 150
                                  (empty-scene 300 300)))

; incrementar : Number -> Number
; suma uno a su argumento
(define (incrementar n) (if (= n 150) 0 (+ n 1)))


; decrementar : Number -> Number
; Devuelve el predecesor de un número positivo. Si el número es 0, devuelve 100. 
(define (decrementar n) (if (= n 0) 100 (- n 1)))

(big-bang 10
          [to-draw pantalla] 
          [on-tick incrementar]    
          )