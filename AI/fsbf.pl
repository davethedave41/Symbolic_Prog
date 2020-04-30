goal([]).

prove(X,KB) :-
    bfsearch([X],KB).

arc([Node|Rest],Next,KB) :-
    member(Node,KB,0,Frontin),
    append(Rest,Frontin,Next).

bfsearch(Node,_) :-
    goal(Node).
bfsearch(Node, KB) :-
    arc(Node,Next,KB),
    print(Next),
    bfsearch(Next,KB).

member(Node,KB,Index,Frontier) :-
    nth0(Index,KB,Nodes),
    nth0(0,Nodes,Node,Frontier).
member(Node,KB,Index,Frontier) :-
    length(KB,Len),
    Index < Len,
    NextIndex is Index + 1,
    member(Node,KB,NextIndex,Frontier).
