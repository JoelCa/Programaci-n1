;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ej) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))
; Ejercicio 6
(define ALTO 300) ; alto de la escena donde se dibuje el círculo
(define ANCHO 300)  ; ancho de la escena donde se dibuje el círculo

(define INICIAL (make-posn (/ ANCHO 2) (/ ALTO 2)))

(define RADIO 50)

; pantalla : Posn -> Image
(define (pantalla n) (place-image (circle RADIO "solid" "red") (posn-x n) (posn-y n)
                                  (empty-scene ANCHO ALTO)))

(define DELTA 3) 

; incrementar : Number -> Number
; suma DELTA a su argumento
(define (incrementar n) (if (>= n (- ALTO RADIO DELTA)) n (+ n DELTA)))


; decrementar : Number -> Number
; resta DELTA de su argumento, devolviendo 0 si su argumento es menor o igual a DELTA
(define (decrementar n) (if (<= n (+ RADIO DELTA)) n (- n DELTA)))

(define (cambiar-x p x) (make-posn x (posn-y p)))

(define (cambiar-y p y) (make-posn (posn-x p) y))

(define (tecla n k) (cond [(string=? k " ") INICIAL]
                          [(string=? k "up") (cambiar-y n (decrementar (posn-y n)))]
                          [(string=? k "down") (cambiar-y n (incrementar (posn-y n)))]
                          [(string=? k "left") (cambiar-x n (decrementar (posn-x n)))]
                          [(string=? k "right") (cambiar-x n (incrementar (posn-x n)))]
                          [else n]))

(define (mouse-handler n x y event) (cond [(string=? event "button-down") (make-posn x y)]
                                          [else n]))
                            
(big-bang INICIAL                 
          [to-draw pantalla] 
          [on-key tecla]
          [on-mouse mouse-handler]
          )