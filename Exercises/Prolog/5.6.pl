unifiable( [], _, []).
unifiable( [L|List], Term, [L|Matches]) :-
  L = Term, 
  !,
  unifiable(List, Term, Matches).
unifiable( [_|List], Term, Matches) :- unifiable(List, Term, Matches).
