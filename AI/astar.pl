goal([]).

prove(X,KB,Path) :-
    astar([X],KB,0,Path).

arc([Node|Rest],Next,KB,Cost) :-
    member(Node,KB,0,Frontin),
    append(Rest,Frontin,Next),
    % write(Frontin),
    length(Frontin,Len),
    Cost is Len+1.

astar(Node,_,Cost,Path) :-
    Path = [],
    goal(Node),
    print('Cost = '),
    print(Cost).

astar(Node,KB,Cost,[Node|Path]) :-
    findall([X,ACost],arc(Node,X,KB,ACost),Arcs),
    % print(Arcs),
    length(Arcs, Len),
    Len > 1,
    nth0(0,Arcs,Node1,Rest),
    theRealOne(Node1,Rest,ChosenOne),
    nth0(0,ChosenOne,TheNode),
    nth0(1,ChosenOne,TheCost),
    NewCost is TheCost+Cost,
    astar(TheNode,KB,NewCost,Path).
astar(Node,KB,Cost,[Node|Path]) :-
    arc(Node,Next,KB,ACost),
    % print(Next),
    NewCost is ACost+Cost,
    astar(Next,KB,NewCost,Path).

theRealOne(Node1, [Node2|T],ChosenOne) :-
    less_than(Node1,Node2),
    length(T, Len),
    Len = 0,
    ChosenOne = Node1.
theRealOne(Node1,[Node1,Node2|T],ChosenOne) :-
    less_than(Node1,Node2),
    theRealOne(Node1,T,ChosenOne).
theRealOne(Node1,[Node1,Node2|T],ChosenOne) :-
    \+less_than(Node1,Node2),
    theRealOne(Node2,T,ChosenOne).


heuristic(Node,H) :-
    length(Node,H).

less_than([Node1,Cost1],[Node2 ,Cost2]) :-
    heuristic(Node1,Hvalue1),
    heuristic(Node2,Hvalue2),
        F1 is Cost1+Hvalue1,
        F2 is Cost2+Hvalue2,
            F1 =< F2.

member(Node,KB,Index,Frontier) :-
    nth0(Index,KB,Nodes),
    nth0(0,Nodes,Node,Frontier).
member(Node,KB,Index,Frontier) :-
    length(KB,Len),
    Index < Len,
    NextIndex is Index + 1,
    member(Node,KB,NextIndex,Frontier).
