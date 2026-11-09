# laboratorios-ProgramacionDeclarativa

## Laboratorio 6: intereses bancarios (Racket)

Archivo: `laboratorio06_MichelleHernandez.rkt`.

La funcion `(interes deposito)` devuelve el monto del interes en dolares.
La funcion `(tasa-interes deposito)` devuelve la tasa como proporcion:
3.5% hasta $40,000 inclusive, 4% hasta $260,000 inclusive y 4.5% por encima
de $260,000. La tasa se aplica sobre todo el deposito.

Ejemplo: `(interes 40000)` devuelve `1400`.

Ejecutar los ejemplos con `racket laboratorio06_MichelleHernandez.rkt`
o abrir el archivo en DrRacket y pulsar Run.
Ejecutar las pruebas con `raco test laboratorio06_MichelleHernandez.rkt`.
