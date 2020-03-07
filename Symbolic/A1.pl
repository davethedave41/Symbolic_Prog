% Given knowledge base
numeral(0).
numeral(p(X))       :- numeral(X).
numeral(s(X))       :- numeral(X).
numeral(X+Y)        :- numeral(X), numeral(Y).
numeral(-X)         :- numeral(X).
numeral(X-Y)        :- numeral(X), numeral(Y).

add(0,X,X).
add(p(X),s(Y),Z)    :- add(X,Y,Z).
add(s(X),Y,s(Z))    :- add(X,Y,Z).
add(p(X),Y,p(Z))    :- add(X,Y,Z).

% Exercise 2 + 4 
add2(-(X-Y),B,Z)    :- subtract(X,Y,R), minus(R,O), add2(O,B,Z).
add2(-X,Y,Z)        :- minus(X,O), add2(O,Y,Z). % 4
add2(X,-Y,Z)        :- minus(Y,O), add2(X,O,Z). % 4
add2(p(s(X)),Y,Z )  :- add(X,Y,Z).  % 2
add2(X,p(s(Y)),Z)   :- add(X,Y,Z).  % 2
add2(s(p(X)),Y,Z)   :- add(X,Y,Z).  % 2
add2(X,s(p(Y)),Z)   :- add(X,Y,Z).  % 2

% Exercise 1 + 6
add2(X+Y,A+B,Z)     :- add(X,Y,M), add(A,B,N), add(M,N,Z).
add2(X+Y,B,Z)       :- add(X,Y,M), add(B,M,Z).
add2(X,Y+B,Z)       :- add(Y,B,M), add(X,M,Z).
add2(X,Y,Z)         :- add(X,Y,Z).

% Exercise 3
minus(s(p(X)),Y)    :- minus(X,Y).
minus(p(s(X)),Y)    :- minus(X,Y).
minus(s(X),p(Y))    :- minus(X,Y).
minus(s(X),Y)       :- minus(X,Y).
minus(p(X),s(Y))    :- minus(X,Y).
minus(p(X),Y)       :- minus(X,Y).
minus(X,X).

% Exercise 5
subtract(X,0,X).
subtract(X,-Y,Z)         :- minus(Y,O), subtract(X,O,Z). 
subtract(p(s(X)),Y,Z)    :- subtract(X,Y,Z).
subtract(s(p(X)),Y,Z)    :- subtract(X,Y,Z).
subtract(s(X),s(Y),Z)    :- subtract(X,Y,Z).
subtract(p(X),p(Y),Z)    :- subtract(X,Y,Z).
subtract(X,p(s(Y)),Z)    :- subtract(X,Y,Z).
subtract(X,s(p(Y)),Z)    :- subtract(X,Y,Z).
%subtract(s(X),p(Y),Z)   :- subtract(X,Y,Z).
subtract(X,s(Y),p(Z))    :- subtract(X,Y,Z).
subtract(X,p(Y),s(Z))    :- subtract(X,Y,Z).

% Exercise 6
subtract(X,Y-B,Z)        :- subtract(Y,B,M), subtract(X,M,Z).