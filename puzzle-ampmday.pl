:- use_module(library(clpfd)).
puzzle1([A,M] + [P,M] = [D,A,Y]) :-
    Vars = [A,M,P,D,Y],
    Vars ins 0..9,
    all_different(Vars),
    A*10 + M + P*10 + M #= D*100 + A*10 + Y,
    A #\= 0,
    P #\= 0,
    D #\= 0,
    label([A,P,M,D,Y]),
    write("["),write(A),write(","),write(M),write("]"),write("+"),write("["),write(P),write(","),write(M),write("]"),write("="),write("["),write(D),write(","),write(A),write(","),write(Y),write("]"),write(\n).
main:-
    findall([A,M,P,D,Y],puzzle1([A,M],[P,M],[D,A,Y]),Bag),
    open('output-ampmday.txt',write,Stream),
    write(Stream,Bag),nl(Stream),
    length(Bag,X),
    write("There are"),write(X),write("solutions"),
    write(Stream,X),nl(Stream),
    close(Stream).
