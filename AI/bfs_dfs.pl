%Create a list of the instantiations Template gets successively on backtracking over Goal and unify the result with Bag. Succeeds with an empty list if Goal has no solutions. findall/3 is equivalent to bagof/3 with all free %variables bound with the existential operator (^), except that bagof/3 fails when Goal has no solutions.

arc(N,M,Seed) :- M is N*Seed.
arc(N,M,Seed) :- M is N*Seed +1.
goal(N,Target) :- 0 is N mod Target.
breadth1st(Start, Found, Seed, Target) :-
     fsB([Start],Found,Seed,Target).
fsB([Node|_],Node,_,Target) :-
    goal(Node,Target).
fsB([Node|Rest],Found,Seed,Target) :-
    findall(Next, arc(Node,Next,Seed), Children),
        append(Rest,Children,NewFrontier),
            fsB(NewFrontier,Found,Seed,Target).
depth1st(Start, Found, Seed, Target) :-
    fsD([Start],Found,Seed,Target).
fsD([Node|_],Node,_,Target) :-
    goal(Node,Target).
fsD([Node|Rest],Found,Seed,Target) :-
    findall(Next, arc(Node,Next,Seed), Children),
        append(Children,Rest,NewFrontier),
            fsD(NewFrontier,Found,Seed,Target).
