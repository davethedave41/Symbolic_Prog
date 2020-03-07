% accept(+Trans,+Final,+Q,?List)
accept(_,Final,Q,[]) :-
     member(Q,Final).
accept(Trans,Final,Q,[H|T]) :-
     member([Q,H,Qn],Trans),
     accept(Trans,Final,Qn,T).
member(X,[X|_]).
member(D,[_|T]) :- member(D,T).
%[[[a, s], d, [d, a, s]], [[s], a, [a, s]], [q0, s, [s]]]
