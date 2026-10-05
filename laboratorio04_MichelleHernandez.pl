almacenar(N, L) :-
    integer(N),
    M is abs(N),
    digitos(M, L).

digitos(N, [N]) :-
    N < 10.
digitos(N, [D|R]) :-
    N >= 10,
    D is N mod 10,
    M is N // 10,
    digitos(M, R).
