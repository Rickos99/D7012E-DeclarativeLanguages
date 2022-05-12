split1([], [], []).
split1([L|List], Pos, [L|Neg]) :- L < 0, split1(List, Pos, Neg).
split1([L|List], [L|Pos], Neg) :- L >=0, split1(List, Pos, Neg).

split2([], [], []) :- !.
split2([L|List], Pos, [L|Neg]) :- L < 0, !, split1(List, Pos, Neg).
split2([L|List], [L|Pos], Neg) :- L >=0, split1(List, Pos, Neg).
