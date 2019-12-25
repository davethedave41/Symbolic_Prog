%12  is  2*6.   =   T           
%14  =\=  2*6.  =   T     
%14  =  2*7.   =    F
%14  ==  2*7.   =    F  
%14  \==  2*7.  =   T   
%14  =:=  2*7.  =   T   
%[1,2,3|[d,e]]  ==  [1,2,3,d,e].    =   T   
%2+3  ==  3+2.  =   F   
%2+3  =:=  3+2. =   T   
%7-2  =\=  9-2. =   T   
%p  ==  ’p’.    =   T   
%p  =\=  ’p’.   =   F
%vincent  ==  VAR.  =   F     
%vincent=VAR,  VAR==vincent.    =   T

% T shouldn't be left uninitialised
termtype(Term, atom) :- atom(Term).
termtype(Term, number) :- number(Term).
termtype(Term, variable) :- var(Term). 
termtype(Term, constant) :- atomic(Term).
termtype(Term, non_var) :- nonvar(Term). 
termtype(Term, simple_term) :- termtype(Term, constant).    % could use nonvars here, meh
termtype(Term, simple_term) :- termtype(Term, variable).
termtype(Term, complex_term) :- \+termtype(Term, simple_term),
                                functor(Term,F,A), >(A, 0).
termtype(Term, term) :- termtype(Term, simple_term);
                        termtype(Term, complex_term).

groundterm(Term) :-
  nonvar(Term),
  Term =.. [_ | X],
  groundterm_in_list(X).

groundterm_in_list([H|T]) :-
  groundterm(H),
  groundterm_in_list(T).
groundterm_in_list([]).

getAllArgs(X,L) :- 
 X =.. [_|L].