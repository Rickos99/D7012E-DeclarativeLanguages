:- ["L11"].

% a)
last1(Item, List) :- conc(_, [Item], List).

% b)
last2(Item, [Item]).
last2(Item, [_|List]) :- last2(Item, List).
