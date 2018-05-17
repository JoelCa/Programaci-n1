;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname ej9) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Ejercicio 5

(define ALTO 60)
(define ANCHO 800)

(define-struct texto [s color tam])

(define INICIAL (make-texto "" "indigo" 20))

; pantalla : String -> Image
(define (pantalla t) (place-image/align (text (texto-s t) (texto-tam t) (texto-color t))
                                        0 0 "left" "top" (empty-scene ANCHO ALTO)))

(define (string-remove-last s) (substring s 0 (- (string-length s) 1)))

(define (cambiar-s t s) (make-texto s (texto-color t) (texto-tam t)))

(define (cambiar-color t c) (make-texto (texto-s t) c (texto-tam t)))

(define (cambiar-tam t tam) (make-texto (texto-s t) (texto-color t) tam))

(define (inc a b) (if (> (+ a b) (* ALTO 2/3)) a (+ a b)))

(define (dec a b) (if (> a b) (- a b) 1))

(define (tecla t k) (cond [(string=? k "\b") (if (string=? (texto-s t) "") (cambiar-s t "")
                                                 (cambiar-s t (string-remove-last (texto-s t))))]
                          [(string=? k "f1") (cambiar-color t "red")]
                          [(string=? k "f2") (cambiar-color t "green")]
                          [(string=? k "f3") (cambiar-color t "blue")]
                          [(string=? k "f4") (cambiar-color t "black")]
                          [(string=? k "f5") (cambiar-color t "yellow")]
                          [(string=? k "f6") (cambiar-color t "indigo")]
                          [(string=? k "up") (cambiar-tam t (inc (texto-tam t) 1))]
                          [(string=? k "down") (cambiar-tam t (dec (texto-tam t) 1))]
                          [else (cambiar-s t (string-append (texto-s t) k))]))

(big-bang INICIAL                 
          [to-draw pantalla]
          [on-key tecla]
          )