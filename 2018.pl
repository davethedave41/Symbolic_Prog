q(a).
q(X) :- X=b,!.
q(c).

bird(penguin).
bird(albatroz).

fly(X) :- bird(X), X\=penguin.

pos(s(0)).
pos(s(X)) :- pos(X).

neg(p(0)).
neg(p(X)) :- neg(X).

pure(0).
pure(X) :- pos(X); neg(X).

mixed(0).
mixed(s(X)) :- mixed(X).
mixed(p(X)) :- mixed(X).

member(X,[X|_]).
member(X,[_|T]) :- member(X,T).

nonmember(X, L) :- \+ member(X,L).

diff(X,L1,L2) :- member(X, L1), nonmember(X, L2).
% sublist(+L, +Begin, +End,?SubL)
% + = instantiated 
% ? = uninstantiated

sublist(L,B,E,SL) :-  
    NewE is E+1, 
    subListD(0,L,B,NewE,SL).

subListD(E,_,_,E,[]).
subListD(I,L,B,E,SL) :- I<B, NewI is I + 1, subListD(NewI,L,B,E,SL).
subListD(I,[L|LT],B,E,[L|SL]) :- NewI is I + 1, subListD(NewI,LT,B,E,SL).

:- dynamic h/2.

harmonic(N,H) :- h(N,H),!.
harmonic(N,H) :- 
    harmonicd(N,0,H),
    assert(h(N,H)).

harmonicd(0,Sum,Sum).
harmonicd(N,H,Sum) :- 
    X is 1/N, 
    S is X+H,
    NewN is N-1,
    harmonicd(NewN,S,Sum).

s(X,Y)   --> as(X), bs(X), bs(Y), cs(Y),!.
as(0)    --> [].
as(NewX) --> [a], as(X), {NewX is X+1}.
bs(0)    --> [].
bs(NewX) --> [b], bs(X), {NewX is X+1}.
cs(0)    --> [].
cs(NewX) --> [c], cs(X), {NewX is X+1}. 


setof(Len,X,Y)   --> ass(Len,X), bss(Len,X), bss(Len,Y), css(Len,Y),!.
ass(_,0)    --> [].
ass(0,_)    --> [].
ass(Len,NewX) --> [a], ass(L,X), {Len is L+1}, {NewX is X+1}.
bss(_,0)    --> [].
bss(0,_)    --> [].
bss(Len,NewX) --> [b], bss(L,X), {NewX is X+1}, {Len is L+1}.
css(_,0)    --> [].
css(0,_)    --> [].
css(Len,NewX) --> [c], css(L,X), {NewX is X+1}, {Len is L+1}. 

sd(X,Y,A-E)   :- asd(X,A-B), bsd(X,B-C), bsd(Y,C-D), csd(Y,D-E),!.
asd(0,W-W).
asd(NewX,A-B) :- X is NewX + 1, asd(X,[a|A]-B).
bsd(0,W-W).
bsd(NewX,A-B) :-  X is NewX + 1,bsd(X,[b|A]-B).
csd(0,W-W).
csd(NewX,A-B) :-  X is NewX + 1,csd(X,[c|A]-B).  

sx(X,A-B)     :- ax(X,A-B).
ax(0,[W|[]]-W).
ax(NewX,A-C)  :-  a(NewX,A-B),ax(X,A-C), NewX is X + 1.
a(X,[a|W]-W).
