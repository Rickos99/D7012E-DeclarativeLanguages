:- ["L12"].

candidates( Candidates, RuledOut, Selected) :- member(Selected, Candidates), not(member(Selected, RuledOut)).
