%
% X  =  3*4. -> X = 3 * 4
% X  is  3*4. -> X = 12
% 4  is  X. -> ERROR
% X  =  Y. -> X = Y
% 3  is  1+2. -> true
% 3  is  +(1,2). -> true
% 3  is  X+2. -> ERROR
% X  is  1+2. -> X = 3
% 1+2  is  1+2. -> true
% is(X,+(1,2)). -> X = 3 (prefix operator)
% 3+2  =  +(3,2). -> true
% *(7,5)  =  7*5. -> true
% *(7,+(3,2))  =  7*(3+2). -> true
% *(7,(3+2))  =  7*(3+2). -> true
% 7*3+2  =  *(7,+(3,2)). -> true
% *(7,(3+2))  =  7*(+(3,2)). -> true

increment(X, Z) :- Z is X+1.

addone([],[]).
addone([H|T],[H1|T1]) :- H1 is H+1, addone(T,T1).  

scalarMult(X,[],[]).
scalarMult(X,[H|T],[RH|RT]) :- RH is H*X, scalarMult(X,T,RT).  

dot([],[],0).
dot([H1|T1],[H2|T2],T) :- R is *(H1,H2), dot(T1,T2,RT), T is +(R,RT).   

len([],0).
len([_|L],N) :- len(L,X), N is X+1.

accLen([],Acc,Length) :- Length = Acc.
accLen([_|L],OldAcc,Length) :- NewAcc is OldAcc + 1,
                               accLen(L,NewAcc,Length).

accMax([],MAX,MAX).
accMax([L|L1],OldMax,MAX) :- L > OldMax, accMax(L1, L, MAX).
accMax([L|L1],OldMax,MAX) :- L < OldMax, accMax(L1, OldMax, MAX).  


