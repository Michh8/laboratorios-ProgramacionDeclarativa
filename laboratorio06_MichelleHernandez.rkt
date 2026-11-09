#lang racket

; Laboratorio 6 - Actividad evaluada
; El banco aplica una sola tasa sobre el deposito completo.
(provide tasa-interes interes)

; Devuelve la tasa asignada como proporcion: 3.5%, 4% o 4.5%.
(define (tasa-interes deposito)
  (unless (and (real? deposito) (>= deposito 0))
    (raise-argument-error 'tasa-interes "numero real no negativo" deposito))
  (cond
    [(<= deposito 40000) 35/1000]
    [(<= deposito 260000) 4/100]
    [else 45/1000]))

; Devuelve el monto del interes en dolares, sin sumar el deposito.
(define (interes deposito)
  (* deposito (tasa-interes deposito)))

(module+ main
  (displayln (interes 40000))   ; 1400
  (displayln (interes 100000))  ; 4000
  (displayln (interes 260000))  ; 10400
  (displayln (interes 300000))) ; 13500

(module+ test
  (require rackunit)
  (check-equal? (interes 0) 0)
  (check-equal? (interes 39999) (* 39999 35/1000))
  (check-equal? (interes 40000) 1400)
  (check-equal? (interes 40001) (* 40001 4/100))
  (check-equal? (interes 259999) (* 259999 4/100))
  (check-equal? (interes 260000) 10400)
  (check-equal? (interes 260001) (* 260001 45/1000))
  (check-equal? (interes 300000) 13500)
  (check-exn exn:fail:contract? (lambda () (interes -1))))
