sx(A-D) :-  foo(A-B),bar(B-C),wiggle(C-D).
foo([choo|W]-W).
foo(A-D)  :-  foo(A-B),foo(B-D).
bar(A-D)  :-  mar(A-B),zar(B-D).
mar(A-D)  :-  me(A-B),my(B-D).
me([i|W]-W).
my([am|W]-W).
zar(A-D)  :-  blar(A-B),car(B-D).
blar([a|W]-W).
car([train|W]-W).
wiggle([toot|W]-W).
wiggle(A-D)  :-  wiggle(A-B),wiggle(B-D).   %difference list implementation.

sa --> la, ra.
sa --> la, sa, ra.
la --> [a].
ra --> [b].

sb --> [].
sb --> lb, sb, rb, rb.
lb --> [a].
rb --> [b].