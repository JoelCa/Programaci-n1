;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ej6) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Ejercicio 5

(define ALTO 300) ; alto de la escena donde se dibuje el círculo
(define ANCHO 300)  ; ancho de la escena donde se dibuje el círculo


(define RADIO 50)

(define INICIAL "")

; pantalla : String -> Image
(define (pantalla s) (place-image/align (text s 20 "indigo")
                                        0 0 "left" "top" (empty-scene 800 60)))

(define (string-remove-last s) (substring s 0 (- (string-length s) 1)))

(define (tecla s k) (cond [(string=? k "\b") (if (string=? s "") "" (string-remove-last s))]
                          [else (string-append s k)]))

(big-bang INICIAL                 
          [to-draw pantalla]
          [on-key tecla]
          )
