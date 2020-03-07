append([],L,L).
append([H|T],L2,[H|L3]) :- append(T,L2,L3).

%% member(X,[X|T]).
%% member(X,[H|T]) :- member(X,T).

prefix(P,L) :- append(P,_,L).  
suffix(S,L) :- append(_,S,L).

sublist(Sub, List) :- suffix(Suffix,List),
                      prefix(Sub, Suffix).

accReverse([],L,L).
accReverse([H|T],Acc,Rev) :- 
        accReverse(T,[H|Acc],Rev).

%% wrapper
reverse(L1,L2) :- accReverse(L1,[],L2).

palindrome(L) :- reverse(L,LRev), 
                 LRev = L.

toptail([IH|IT],L) :- reverse(IT,[OH|OT]),
                      reverse(OT,ROT),
                      L = ROT.

doubled(LD) :- append(X,X,LD).

last([H|[]],H). 
last([H|T],X) :- last(T,X).

%% last(L,X) :- reverse(L,[H|T]),      -- last using reverse
%%             X = H.

swapfl([H1|T1],[H2|T2]) :- reverse([H2|T2],[H2R|T2R]),
                      append([],[H2R|T1],[H1|T1]). 

%% house(Color,Nationality,Pet).
%% zebra(ZebraOwner) :-
%%                   Street = [_,_,_],
%%                   member(house(red,englishman,_),Street),
%%                   member(house(_,spanish,jaguar),Street),
%%                   member(house(_,ZebraOwner,zebra),Street),
%%                   sublist([house(_,_,snail),house(_japanese,_)],Street),
%%                   sublist([house(_,_,snail),house(blue,_,_)],Street).

member(X,L1) :- append(_,[X],L1).

set([],[]).
set([H1|T1],[H2|T2]) :- member(H1,[H2|T2]), set(T1,T2).
set([H1|T1],[H1|T2]) :- set(T1,T2).

