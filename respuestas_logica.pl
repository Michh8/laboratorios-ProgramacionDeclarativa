% Respuestas correctas de logica proposicional.
% Consulta de ejemplo:
% ?- respuesta(1, Formula).

% 1.
% Enunciado: Si la informacion no es completa para oferentes y demandantes,
% hay una falla de mercado.
% Simbolizacion:
% p: La informacion es completa para oferentes y demandantes.
% q: Hay una falla de mercado.
% Logica simbolica: ~p -> q
respuesta(1, implica(no(p), q)).

% 2.
% Enunciado: He pasado todas mis vacaciones en Grecia y Marruecos.
% Simbolizacion:
% p: He pasado todas mis vacaciones en Grecia.
% q: He pasado todas mis vacaciones en Marruecos.
% Logica simbolica: p ^ q
respuesta(2, y(p, q)).

% 3.
% Enunciado: La realidad supera a la ficcion y el no puede creerlo.
% Simbolizacion:
% p: La realidad supera a la ficcion.
% q: El puede creerlo.
% Logica simbolica: p ^ ~q
respuesta(3, y(p, no(q))).

% 4.
% Enunciado: Se entrega o nel pues.
% Simbolizacion:
% p: Se entrega.
% Logica simbolica: p v ~p
respuesta(4, o(p, no(p))).
