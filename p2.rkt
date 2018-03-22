;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname p2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Ejercicio 2
; distancia-puntos : Number Number Number Number Number -> Number
; Recibe los valores del plano cartesiano (x1,y1) y (x2,y2), y retorna
; la distancia entre estos dos puntos
(check-within (distancia-puntos 4 10 99 88) 122.9186723000212 0.1)
(define (distancia-puntos x1 y1 x2 y2) (sqrt (+ (sqr (- x2 x1))
                                                (sqr (- y2 y1)))))

; Ejercicio 8
; string-remove-last : String -> String
; Recibe una cadena de caracteres, y retorna la cadena sin el último
; caracter.
(check-expect (string-remove-last "hola mundo") "hola mund")
(define (string-remove-last s) (substring s 0 (- (string-length s) 1)))

