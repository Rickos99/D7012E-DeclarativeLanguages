:- ["L12"].

nthchild(Family, N, Nthchild) :-
  Family = family(_, _, Children),
  nth_member(N, Children, Nthchild).

nth_member(0, [L|_], L) :- !.
nth_member(N, [_|List], L) :- 
  Next is N-1, 
  nth_member(Next, List, L).
