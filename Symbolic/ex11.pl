%assert(q(a,b)). 
%assertz(q(1,2)).
%asserta(q(foo,blug)).
q(blob,blug).
q(blob,blag).
q(blob,blig).
q(blaf,blag).
q(dang,dong).
q(dang,blug).
q(flab,blob).

mySigma(0, Sum, Sum) :- !.

mySigma(N, Acc, Sum) :-
  is(DecN, -(N, 1)),
  is(NewAcc, +(Acc, N)),
  mySigma(DecN, NewAcc, Sum).

:- dynamic sigmares/2.

sigma(N,Sum) :-
    sigmares(N,Sum),!.

sigma(N,Sum) :- mySigma(N,0,Sum),
    assert(sigmares(N,Sum)).
