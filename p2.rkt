;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname p2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; "A B -> C" equivale a "A -> B -> C"? 

; Ejercicio 2
; distancia-puntos : Number Number Number Number -> Number
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


; Ejercicio 9

(define CUOTA 650)

; precio-con-descuento : Number Number -> Number
; dado un precio y un porcentaje de descuento,
; calcula el precio con el descuento dado.
(define (precio-con-descuento p d) (- p (/ (* d p) 100)))

(define (promo1 p) (cond [(= p  2) 10]
                         [(> p 2) 20]
                         [else 0]))

(define (promo2 m) (cond [(= m 2) 15]
                         [(> m 2) 25]
                         [else 0]))

(check-expect (monto-persona 2 2) 975)

(check-expect (monto-persona 3 3) 1267.5)

(check-expect (monto-persona 1 5) 2437.5)


; monto-persona : Number Number -> Number
; recibe la cantidad de personas que se anotan y la cantidad de meses que abonan,
; y devuelve el monto que deben pagar cada uno.
(define (monto-persona p m) (precio-con-descuento (* m CUOTA) (min 35 (+ (promo1 p) (promo2 m)))))

; Ejercicio 10

(define 1MES 1)

(define 6MESES 6)

(define 1AÑO 12)

(define 5AÑOS 60)

(define 10AÑOS 120)

(define (mínimo-hemoglobina edad) (cond [(and (< 0 edad) (<= edad 1MES)) 13]
                                        [(and (< 1MES edad) (<= edad 6MESES)) 10]
                                        [(and (< 6MESES edad) (<= edad 1AÑO)) 11]
                                        [(and (< 1AÑO edad) (<= edad 5AÑOS)) 11.5]
                                        [(and (< 5AÑOS edad) (<= edad 10AÑOS)) 12.6]
                                        [(< 10AÑOS edad) 13]
                                        [else "error: edad incorrecta"]))
; anemia : Number Number -> Bool
; recibe la edad expresada en meses y el nivel de hemoglobina
; en sangre del paciente, y determina si tiene anemia.
(define (anemia edad hem) (< hem (mínimo-hemoglobina edad)))
