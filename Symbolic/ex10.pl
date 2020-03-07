class(Number,positive)  :-  Number  >  0, !.
class(0,zero) :- !.
class(Number,negative)  :-  Number  <  0, !.

split([],[],[]).
split([HP|TL],[HP|TP],N) :- 
    class(HP, positive),!,
        split(TL,TP,N).
split([HP|TL],[HP|TP],N) :- 
    class(HP, zero),!,
        split(TL,TP,N).
split([HN|TL],P,[HN|TN]) :- 
    class(HN, negative),!,
        split(TL,P,TN).

directTrain(saarbruecken,dudweiler).
directTrain(forbach,saarbruecken).
directTrain(freyming,forbach).
directTrain(stAvold,freyming).
directTrain(fahlquemont,stAvold).
directTrain(metz,fahlquemont).
directTrain(nancy,metz).

directPath(X,Y) :- 
    directTrain(X,Y).
directPath(X,Y) :- 
    directTrain(Y,X).

append([],L,L).
append([H1|T1],L2,[H1|T3]) :-
    append(T1,L2,T3).

prefix(P,L) :- 
    append(P,_,L).

suffix(S,L) :- 
    append(_,S,L).

accReverse([],L,L).
accReverse([H|T],Acc,Rev) :-
    accReverse(T,[H|Acc],Rev).

reverse(L,RevL) :- 
    accReverse(L,[],RevL).

route(Y,Y,Rev,L) :-
    reverse(Rev,L).
 
route(X, Y, RevL, L) :-
    directPath(X, Z),
    \+member(Z, RevL),
    route(Z, Y, [Z | RevL], L).

route(X, Y, L) :-
    route(X, Y, [X], L).  

loves(david,somehoe).
loves(conor,somehoe).
jealous(X,Y) :- loves(X,Z), loves(Y,Z), Y \= X.
