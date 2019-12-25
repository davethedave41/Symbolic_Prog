s   -->  np(pl),vp(pl).
s   -->  np(sg), vp(sg).
np(X)  -->  det(X),n(X).
vp(X)  -->  v(X), np(X).
vp(X)  --> v(X).
det(_) -->  [the].
det(sg) -->  [a].
n(sg) --> [woman].
n(pl) --> [women].
n(sg) --> [man].
n(pl) --> [men].
n(sg) --> [apple].
n(sg) --> [pear].
v(pl) --> [eat].
v(sg) --> [eats].

%kanga(V,R,Q)  -->  roo(V,R),
%                    jumps(Q,Q),
%                    {marsupial(V,R,Q)}.

%kanga(V,R,Q,A-C) :- roo(V,R,A-B),
%                    jumps(Q,Q,B-C),
%                    marsupial(V,R,Q).
%        %OR
kanga(A,C) :- roo(A,B), marsupial(B,C).
roo(A, [uh,lemme,get]).
marsupial(B,[a,croissant|B]).       