% Lista de comandos de listas en Prolog.
% Cargar en SWI-Prolog:
% ?- [lista_comandos_resuelto].
% ?- run_tests.

:- use_module(library(lists)).

% member(E, List).
% Es un predicado incorporado en SWI-Prolog.
% Ejemplo:
% ?- member(2, [1,2,3]).

% Longitud de una lista.
list_length([], 0).
list_length([_|Tail], N) :-
    list_length(Tail, TailLength),
    N is TailLength + 1.

% Concatenar listas.
% Equivalente a append(List1, List2, Resultado).
list_concat([], L, L).
list_concat([X1|L1], L2, [X1|L3]) :-
    list_concat(L1, L2, L3).

% Borrar la primera aparicion de X en una lista.
list_delete(X, [X], []).
list_delete(X, [X|L1], L1).
list_delete(X, [Y|L2], [Y|L1]) :-
    list_delete(X, L2, L1).

% Insertar al inicio.
insert_head(X, L, [X|L]).

% Insertar al final.
insert_tail(X, L, R) :-
    list_concat(L, [X], R).

% Insertar X en una lista.
% La idea es que si al borrar X de R se obtiene L,
% entonces R es una lista L con X insertado.
list_insert(X, L, R) :-
    list_delete(X, R, L).

% permutation(L, X).
% Predicado incorporado por library(lists).
% Ejemplo:
% ?- permutation([1,2,3], X).

% combination(+K, +List, -CombinationResult).
combination(0, _, []).
combination(K, [X|Xs], [X|Ys]) :-
    K > 0,
    K1 is K - 1,
    combination(K1, Xs, Ys).
combination(K, [_|Xs], Ys) :-
    K > 0,
    combination(K, Xs, Ys).

% reverse(List, ReverseList).
% Predicado incorporado en SWI-Prolog.
% Ejemplo:
% ?- reverse([1,2,3], R).

% Orden ascendente.
list_order_asc([]).
list_order_asc([_]).
list_order_asc([X, Y | Tail]) :-
    X =< Y,
    list_order_asc([Y|Tail]).

% Orden descendente.
% Esta es la version solicitada.
list_order_desc([]).
list_order_desc([_]).
list_order_desc([X, Y | Tail]) :-
    X >= Y,
    list_order_desc([Y|Tail]).

% Merge sort ascendente.
mergesort([], []).
mergesort([A], [A]).
mergesort([A,B|R], S) :-
    split([A,B|R], L1, L2),
    mergesort(L1, S1),
    mergesort(L2, S2),
    merge(S1, S2, S).

split([], [], []).
split([A], [A], []).
split([A,B|R], [A|Ra], [B|Rb]) :-
    split(R, Ra, Rb).

merge(A, [], A).
merge([], B, B).
merge([A|Ra], [B|Rb], [A|M]) :-
    A =< B,
    merge(Ra, [B|Rb], M).
merge([A|Ra], [B|Rb], [B|M]) :-
    A > B,
    merge([A|Ra], Rb, M).

% Merge sort descendente usando el algoritmo ascendente ya comprobado.
mergesort_desc(List, SortedDesc) :-
    mergesort(List, SortedAsc),
    reverse(SortedAsc, SortedDesc).

% Pruebas para comprobar los predicados principales.
:- begin_tests(lista_comandos).

test(list_length) :-
    list_length([a,b,c], 3).

test(list_concat) :-
    list_concat([1,2], [3,4], [1,2,3,4]).

test(list_delete) :-
    once(list_delete(2, [1,2,3], [1,3])).

test(insert_head) :-
    insert_head(0, [1,2], [0,1,2]).

test(insert_tail) :-
    insert_tail(3, [1,2], [1,2,3]).

test(combination) :-
    once(combination(2, [a,b,c], [a,b])).

test(list_order_asc_true) :-
    list_order_asc([1,2,2,3]).

test(list_order_asc_false, [fail]) :-
    list_order_asc([1,3,2]).

test(list_order_desc_true) :-
    list_order_desc([5,4,4,1]).

test(list_order_desc_false, [fail]) :-
    list_order_desc([5,3,4]).

test(mergesort) :-
    once(mergesort([4,1,3,2], [1,2,3,4])).

test(mergesort_desc) :-
    once(mergesort_desc([4,1,3,2], [4,3,2,1])).

:- end_tests(lista_comandos).
