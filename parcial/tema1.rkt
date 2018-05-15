;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname tema1) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define KM-CIUDAD 8)

(define KM-RUTA 11)

(define NAFTA-SUPER 2)

(define NAFTA-PREMIUM 3)

(define (distancia l x) (* l x))

(define (autonomía litros nafta) (cond [(= nafta 2) (string-append "Autonomía en ciudad: "
                                                                   (distancia litros KM-CIUDAD)
                                                                   "km. Autonomía en ruta: "
                                                                   (distancia litros KM-RUTA))]))