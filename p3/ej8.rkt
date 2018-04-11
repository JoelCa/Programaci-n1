;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ej8) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define ANCHO 500)

(define ALTO 500)

(define FONDO "black")

(define MAX-TAM-EST 40)

(define MIN-TAM-EST 5)

(define COLOR-ESTRELLA "yellow")

(define (estrella t) (star t "solid" COLOR-ESTRELLA))

(define (estrella-ancho2 t) (/ (image-width (estrella t)) 2))

(define INICIAL (rectangle ANCHO ALTO "solid" FONDO))

; pantalla : Image -> Image
(define (pantalla img) img)

(define (tecla img k) (cond [(string=? k " ") INICIAL]
                            [else img]))

; map-en-rango : Number -> Number
; map-en-rango mapea los valores [0, ANCHO] a [MIN-TAM-EST, MAX-TAM-EST]
(define (map-en-rango x) (+ (/ (* (- MAX-TAM-EST MIN-TAM-EST) x) ANCHO) MIN-TAM-EST)) 
  
(define (mouse-handler img x y event) (cond [(string=? event "button-down")
                                             (if (and (<= (+ x (estrella-ancho2 (map-en-rango x))) ANCHO)
                                                      (>= (- x (estrella-ancho2 (map-en-rango x))) 0)
                                                      (<= (+ y (estrella-ancho2 (map-en-rango x))) ALTO)
                                                      (>= (- y (estrella-ancho2 (map-en-rango x))) 0))
                                                 (place-image (estrella (map-en-rango x)) x y img)
                                                 img)]
                                            [else img]))
                            
(big-bang INICIAL        
          [to-draw pantalla]
          [on-key tecla]
          [on-mouse mouse-handler]
          )