add(0,Y,Y).
add(s(X),Y,s(Z)) :- add(X,Y,Z).

multiply(s(0),Y,Y).
multiply(X,s(0),X).
multiply(s(X),Y,Z) :- 
    add(Y,Y,Z), 
        multiply(X,Z,N).


edge(b,a).
symEdge(A,B) :- edge(B,A).

:- dynamic deranged/2.

d(1,0).
d(2,1).

d(N,D) :- N>2,
    X is N-1,
    Y is N-2,
        d(X,D1),
        d(Y,D2),
            D is X*(D1+D2).

%d(N,D) :- N>2,
%    X is N-1,
%    Y is N-2,
%        d(X,D1),
%        d(Y,D2).

len([],0).
len([_|L],NewLength):-
 len(L,Length),
 NewLength is Length + 1.

accLen([],Acc,Acc).
accLen([_|L],OldAcc,Length):-
 NewAcc is OldAcc+1,
 accLen(L,NewAcc,Length).

bin --> [].
bin --> bin, b.
b --> [0].
b --> [1].

pow2(X,Y,Z) :- Z is X**Y.

binary(Acc, Acc, _, []).
binary(Total, Acc, Index, [0|BT]) :-
     NewI is Index+1,
     binary(Total, Acc,NewI, BT). 
binary(Total, Acc,Index, [1|BT]) :-  
    NewTotal is 2 ** Index + Total,
    NewI is Index+1, 
    binary(NewTotal,Acc, NewI, BT).

s(W-W).
s(A-D) :- bs(A-B), s(B-C), calc(A,C-D).
calc(List,A-B) :- 
    digital(X,A-B), 
    {binary(0,Dig,0,List)},
    {X = Dig}.
digital(X,[X|W]-W).
bs([0|W]-W).
bs([1|W]-W).

students --> student(X,Y,Z),student(X2,Y2,Z2),student(X3,Y3,Z3),
    {X2 \= X}, {Y2 \= Y}, {Z2 \= Z}, {X3 \= X2},  {Y3 \= Y2},  {Z3 \= Z2},
    {X3 \= X}, {Y3 \= Y}, {Z3 \= Z}.
student(X,Y,Z) --> name(X), sport(Y), county(Z).
name(X)   --> [Word], {lex(Word, name)}, {X = Word}.
sport(Y)  --> [Word], {lex(Word, sport)}, {Y = Word}.
county(Z) --> [Word], {lex(Word, county)}, {Z = Word}.

lex(chris, name).
lex(pat, name).
lex(sandy, name).
lex(boxing, sport).
lex(tennis, sport).
lex(football, sport).
lex(mayo, county).
lex(dublin, county).
lex(cork, county).









