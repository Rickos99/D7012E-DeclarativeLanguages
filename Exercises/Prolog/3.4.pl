:- ["L11"].

reverse( [], []).
reverse( [X|List], ReversedList) :- reverse(List, R), conc(R, [X], ReversedList).
