% Java envia dos numeros y recibe el resultado R.
% is evalua la operacion; = solamente unificaria la expresion.
suma(A, B, R) :- number(A), number(B), R is A + B.
resta(A, B, R) :- number(A), number(B), R is A - B.
