% 1.01
my_last([Last], Last).
my_last([_|List], Last) :- my_last(List, Last).

% 1.02
penultimate([Last, _], Last).
penultimate([_|List], Last) :- penultimate(List, Last).

% 1.03
kth_element([L|_], 0, L).
kth_element([_|List], K, KthElement) :- 
  K1 is K - 1, 
  kth_element(List, K1, KthElement).

% 1.04
my_length([], 0).
my_length([_|List], Length) :- 
  my_length(List, L1), 
  Length is L1 + 1.

% 1.05
conc( [], L, L).
conc( [X| L1], L2, [X| L3]) :- conc( L1, L2, L3).

my_reverse([L], L).
my_reverse([L|List], Reversed) :- my_reverse(List, R), conc(R, [L], Reversed).

% 1.06
palindrome(List) :- reverse(List, ReversedList), List = ReversedList.

% 1.08
compress([], []).
compress([X], [X]).
compress([X,X|List], C) :- compress([X|List], C).
compress([X,Y|List], [X|C]) :- X \= Y, compress([Y|List], C).
