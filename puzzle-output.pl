puzzle1([H1|T1],[H2|T2],Sum) :-
    length([H1|T1],Length1),
    length([H2|T2],Length2),
    ( Length1 >= Length2 -> ( Length = Length1, AddTop = [H1|T1], Shorter = [H2|T2], Pad is Length1 - Length2 );
    ( Length = Length2, AddTop = [H2|T2], Shorter = [H1|T1], Pad is Length2 - Length1 )), zeroPad(Shorter,Pad,AddPad),
    length(Sum,Size),
    ( Size = Length -> ( C = 0, Sum = TSum , Pool = [1|Peel] );
    ( Size is Length+1, C = 1, Sum = [C|TSum], Pool = Peel )),
    Peel = [2,3,4,5,6,7,8,9,0],
    puzzle1A(H1,H2,AddTop,AddPad,C,TSum,Pool).

puzzle1A(_,_,[],[],0,[],_).
puzzle1A(Variable1,Variable2,[H1|T1],[H2|T2],COut,[H3|T3],Pool) :-
    ( CIn = 0 ; CIn = 1 ),
    ( var(H1) -> select(H1,Pool,P_ol);
    Pool = P_ol),
    (var(H2) -> select(H2,P_ol,P__l);
    P_ol = P__l),
    (var(H3) -> ( H3 is H1 + H2 + CIn - 10*COut, select(H3,P__l,P___) );
    ( H3 is H1 + H2 + CIn - 10*COut, P__l = P___ )),
    Variable1 \== 0,
    Variable2 \== 0,
    puzzle1A(Variable1,Variable2,T1,T2,CIn,T3,P___).


zeroPad(L,0,L).
zeroPad(L,K,P) :-
    K > 0,
    M is K-1,
    zeroPad([0|L],M,P).

main:-
    findall([A,M,P,D,Y],puzzle1([A,M],[P,M],[D,A,Y]),Bag),
    open('output-puzzle1.txt',write,Stream),
    write(Stream,Bag),nl(Stream),
    length(Bag,X),
    write("There are"),write(X),write("solutions"),
    write(Stream,X),nl(Stream),
    close(Stream).

