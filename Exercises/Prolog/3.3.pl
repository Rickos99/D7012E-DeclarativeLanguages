evenlength( []).
evenlength( [_,_|List]) :- evenlength(List).

oddlength( [_|List]) :- evenlength(List).
