leaf(1).
leaf(2).
leaf(3).
leaf(4).
leaf(5).
tree(B1,B2) :- tree(leaf(X),leaf(Y)).
tree(B1,B2) :- tree(leaf(X)).