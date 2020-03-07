%% Q1
%% count starts at 0
s --> u(0). 
u(C) --> [2], {HCount is C/2}, v(HCount).  
u(C) --> [0], {C1 is C+1}, u(C1).
u(C) --> [1], u(C).
v(0) --> [].
v(C) --> [1], {CM1 is C-1}, v(CM1).
v(C) --> [0], v(C).


%% Q2
s2 --> h(X,Y,Z), h(X2,Y2,Z2), {X2 \== X}, {Y2 \== Y}, {Z2 \== Z},
                     h(X3,Y3,Z3), {X3 \== X}, {Y3 \== Y}, {Z3 \== Z},
                       {X3 \== X2}, {Y3 \== Y2}, {Z3 \== Z2}.
h(X,Y,Z) --> col(X), nat(Y), pet(Z).
col(X) --> [Word], {lex(Word, col)}, {X = Word}.
nat(Y) --> [Word], {lex(Word, nat)}, {Y = Word}.
pet(Z) --> [Word], {lex(Word, pet)}, {Z = Word}.

lex(english,  nat).
lex(spanish,  nat).
lex(japanese, nat).
lex(red,      col).
lex(blue,     col). 
lex(green,    col).
lex(zebra,    pet).
lex(snail,    pet).
lex(jaguar,   pet).


%% Q3
%% makes list of all numbers below current number and checks if the current value
%% being used is part of the list and then Z becomes the new number to subtract down to
%% and is checked to be equal to zero just incase it doesn't need to be subtracted anymore
%% or if it is over subtracted then the language fails.       
sum(X)--> [X].
sum(X)--> [Y], {mkList(X,L), member(Y,L), Z is X-Y, Z\=0}, sum(Z).

%% mkList predicate
mkList(0,[]).
mkList(Num,[Num|List]) :- Num1 is Num-1, Num1 >= 0, mkList(Num1,List).
