:- ["L12"].

twins( Child1, Child2) :- 
  family(_, _, Children),
  member(Child1, Children),
  member(Child2, Children),
  Child1 \= Child2,
  Child1 = person(_, _, Birthday, _),
  Child2 = person(_, _, Birthday, _).
