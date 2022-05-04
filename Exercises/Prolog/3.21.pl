between(N1, N2, N1) :- N1 =< N2.
between(N1, N2, X) :- 
  N1 =< N2, 
  N is N1 + 1, 
  between(N, N2, X).
