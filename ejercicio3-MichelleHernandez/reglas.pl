% EJERCICIO 3 - REGLAS

:- consult('hechos.pl').

esta_armado(Persona) :-
    tiene_arma(Persona, _).

fuertemente_armado(Persona) :-
    tiene_arma(Persona, Arma1),
    arma_fuego(Arma1),
    tiene_arma(Persona, Arma2),
    arma_blanca(Arma2).

tiene_arma_fuego(Persona) :-
    tiene_arma(Persona, Arma),
    arma_fuego(Arma).

zona_peligrosa(Zona) :-
    dificultad(Zona, alta);
    dificultad(Zona, muy_alta).

persona_en_peligro(Persona) :-
    se_encuentra_en(Persona, Zona),
    zona_peligrosa(Zona).

companeros_zona(Persona1, Persona2) :-
    se_encuentra_en(Persona1, Zona),
    se_encuentra_en(Persona2, Zona),
    Persona1 \= Persona2.

adulto(Persona) :-
    edad(Persona, Edad),
    Edad >= 18.