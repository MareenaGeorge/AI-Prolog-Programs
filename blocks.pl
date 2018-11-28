:- use_module(library(clpfd)).
put_on(A,B) :- on(A,B).
put_on(A,B) :-
    not(on(A,B)),
    A \== table,
    A \== B,
    clear(A),
    clear(B),
    on(A,X),
    retract(on(A,X)),
    assert(on(A,B)),
    assert(move(A,B)).
clear(table).

clear(A) :- not(on(_X,A)).
clear(A) :- A \== table,
    on(X,A),
    clear(X),
    retract(on(X,A)),
    assert(on(X,table)),
    assert(move(X,table)).

%Execute and find Goal and track path using recursion
path(Goal) :- recurs(Goal,Goal).
recurs([G|R],Goals) :-
    call(G),
    recurs(R,Goals),!.

recurs([G|_],Goals) :-
    reach(G),
    recurs(Goals,Goals).
        recurs([],_Goals).

reach(on(A,B)) :- put_on(A,B).
