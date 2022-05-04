sumlist([], Sum) :- Sum is 0.
sumlist([L|List], Sum) :- sumlist(List, S), Sum is L + S.
