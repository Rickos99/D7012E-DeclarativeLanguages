:- ["L11"].

flatten([], []) :- !.                 % Stop backtracking
flatten([L|List], FlattenedList) :-
  !,                                  % Stop backtracking
  flatten(L, FlatL), 
  flatten(List, FlatList), 
  conc(FlatL, FlatList, FlattenedList).
flatten(L, [L]).

% ?- flatten([a,b,[c,d],[],[[[e]]],f], L).
