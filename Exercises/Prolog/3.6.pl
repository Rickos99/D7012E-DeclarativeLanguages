:- ["L11"].

shift( [L|List1], List2) :- conc(List1, [L], List2).
