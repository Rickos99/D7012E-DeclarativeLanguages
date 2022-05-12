:- ["L12"].

set_difference( [], _, []).
set_difference( [S1|Set1], Set2, SetDifference) :- 
  member(S1, Set2), 
  !,
  set_difference(Set1, Set2, SetDifference).
set_difference( [S1|Set1], Set2, [S1|SetDifference]) :- 
  set_difference(Set1, Set2, SetDifference).
