happy(X) :- parent(X, _).

hastwochildren(X) :- parent(X, Y), sister(Y, _).
