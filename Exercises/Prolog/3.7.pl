:- ["L11"].

means(0, zero).
means(1, one).
means(2, two).
means(3, three).
means(4, four).
means(5, five).
means(6, six).
means(7, seven).
means(8, eight).
means(9, nine).

translate([], []).
translate([L|List], Translation) :- 
  means(L, T), 
  translate(List, TList), 
  conc([T], TList, Translation).
