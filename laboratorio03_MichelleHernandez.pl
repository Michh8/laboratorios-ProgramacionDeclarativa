% Ejercicio:
% Dado un numero N, sumar N con todos los numeros anteriores hasta llegar a 1.
%
% Predicado principal:
%   suma_hasta(+N, -Suma)
%
% Ejemplos:
%   ?- suma_hasta(5, S).
%   S = 15.
%
%   ?- suma_hasta(1, S).
%   S = 1.

% Caso base:
% La suma desde 1 hasta 1 es 1.
suma_hasta(1, 1).

% Caso recursivo:
% Para sumar desde N hasta 1:
%   1. Se calcula la suma de N - 1 hasta 1.
%   2. Se suma N al resultado anterior.
suma_hasta(N, Suma) :-
    N > 1,
    Anterior is N - 1,
    suma_hasta(Anterior, SumaAnterior),
    Suma is N + SumaAnterior.

% Ejemplo de arbol SLD para la consulta:
%   ?- suma_hasta(3, S).
%
% suma_hasta(3, S)
%   N > 1
%   Anterior is 3 - 1        -> Anterior = 2
%   suma_hasta(2, SumaAnterior)
%     N > 1
%     Anterior is 2 - 1      -> Anterior = 1
%     suma_hasta(1, SumaAnterior2)
%       caso base            -> SumaAnterior2 = 1
%     SumaAnterior is 2 + 1  -> SumaAnterior = 3
%   S is 3 + 3               -> S = 6
%
% Resultado:
%   S = 6.
