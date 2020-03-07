% check with user
goal(L) :- write(L), write(’?’), nl, read(yes).
% read/1, in this case if the user inputs 'yes' than the term is unified. else it fails
% nl/0  Write a newline character to the current output stream.
% fixed length lists
arc([X|L],[s(X)|L]).
arc([0|L],[0|L2]) :- arc(L,L2).
search([H|_]) :- goal(H).
search([H|T]) :- findall(X,arc(H,X),Nbrs),
append(T,Nbrs,New),
search(New).
mkZ(s(0),[0]).
mkZ(s(X),[0|L]) :- mkZ(X,L).
game(N) :- mkZ(N,L), search([L]).
% variable length lists
%ar(L,[0|L]).
%ar([X|L],[s(X)|L]).
%bfsearch([H|_]) :- goal(H).
%bfsearch([H|T]) :- findall(X,ar(H,X),Nbrs),
%append(T,Nbrs,New),
%bfsearch(New).
% Initial guess is []
%game :- bfsearch([[]]).
