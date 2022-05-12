% a)
jump( Col/Row, A/B) :-
  (
    (A is Col+1, B is Row+2);
    (A is Col+2, B is Row+1);
    (A is Col+2, B is Row-1);
    (A is Col+1, B is Row-2);
    (A is Col-1, B is Row-2);
    (A is Col-2, B is Row-1);
    (A is Col-2, B is Row+1);
    (A is Col-1, B is Row+2)
  ), location_is_on_board(A/B).

location_is_on_board( Col/Row) :-
  Col >= 1 , Col =< 8,
  Row >= 1 , Row =< 8.

% b)
knightpath( [P]) :- location_is_on_board(P).
knightpath( [P1,P2|Path]) :-
  jump( P1, P2),
  knightpath( [P2|Path]).

/* c)

?- knightpath( [2/1, 5/4, C, 8/1]).
 A = 3/3, B = 7/3 ;
 A = 3/3, B = 6/2 ;
 A = 4/2, B = 7/3 ;
 A = 4/2, B = 6/2.

*/