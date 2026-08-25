% EJERCICIO 3 - HECHOS

% ROLES
agente(leon).
estudiante(ashley).
espia(ada).
investigador(luis).

% EDADES
edad(leon, 27).
edad(ashley, 20).
edad(ada, 26).
edad(luis, 32).

% ARMAS
tiene_arma(leon, pistola).
tiene_arma(leon, cuchillo).
tiene_arma(ada, pistola).
tiene_arma(luis, cuchillo).

% TIPOS DE ARMAS
arma_fuego(pistola).
arma_blanca(cuchillo).

% ENEMIGOS
enemigo(ganado).
enemigo(regenerador).

% INFECCIONES
infectado_por(ganado, las_plagas).
infectado_por(regenerador, las_plagas).

% UBICACION DE ENEMIGOS
aparece_en(ganado, pueblo).
aparece_en(ganado, castillo).
aparece_en(regenerador, isla).

% DIFICULTAD
dificultad(pueblo, alta).
dificultad(castillo, alta).
dificultad(isla, muy_alta).

% UBICACION DE PERSONAJES
se_encuentra_en(leon, pueblo).
se_encuentra_en(luis, pueblo).
se_encuentra_en(ada, pueblo).
se_encuentra_en(ada, castillo).