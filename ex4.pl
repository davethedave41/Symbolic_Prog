 a2b([],[]).
 a2b([a|TA],[b|TB]) :- a2b(TA,TB). 

combine1([],[],[]).
combine1([H1|T1],[H2|T2], [wahooo,H1,H2|List]) :- combine1(T1,T2,List).

member(X,[X|T]).
member(X,[H|T]) :- member(X,T).

