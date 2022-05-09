:- ["kset"].

list_odd_negative(Start, Start, []).
list_odd_negative(Start, End, [Elm|List]) :- 
  Start =< End, 
  NextStart is Start + 1,
  Elm is Start * (-1) ^ Start,
  list_odd_negative(NextStart, End, List).

/*

-? smallest_k_sets([-1, 2, -3, 4, -5], 3).
size  i   j   sublist
-5    5   5   [-5]
-4    3   5   [-3,4,-5]
-3    3   3   [-3]


-? list_odd_negative(0, 100, S), smallest_k_sets(S, 15).
size  i   j   sublist
-99   99  99  [-99]
-98   97  99  [-97,98,-99]
-97   97  97  [-97]
-97   95  99  [-95,96,-97,98,-99]
-96   95  97  [-95,96,-97]
-96   93  99  [-93,94,-95,96,-97,98,-99]
-95   95  95  [-95]
-95   93  97  [-93,94,-95,96,-97]
-95   91  99  [-91,92,-93,94,-95,96,-97,98,-99]
-94   93  95  [-93,94,-95]
-94   91  97  [-91,92,-93,94,-95,96,-97]
-94   89  99  [-89,90,-91,92,-93,94,-95,96,-97,98,-99]
-93   93  93  [-93]
-93   91  95  [-91,92,-93,94,-95]
-93   89  97  [-89,90,-91,92,-93,94,-95,96,-97]


-? smallest_k_sets([24,-11,-34,42,-24,7,-19,21], 6).
size  i   j   sublist
-45   2   3   [-11,-34]
-39   2   7   [-11,-34,42,-24,7,-19]
-36   5   7   [-24,7,-19]
-34   3   3   [-34]
-28   3   7   [-34,42,-24,7,-19]
-27   2   5   [-11,-34,42,-24]


-? smallest_k_sets([3,2,-4,3,2,-5,-2,2,3,-3,2,-5,6,-2,2,3], 8).
size  i   j   sublist
-8    6   12  [-5,-2,2,3,-3,2,-5]
-7    6   7   [-5,-2]
-7    3   12  [-4,3,2,-5,-2,2,3,-3,2,-5]
-6    10  12  [-3,2,-5]
-6    5   12  [2,-5,-2,2,3,-3,2,-5]
-6    3   7   [-4,3,2,-5,-2]
-5    12  12  [-5]
-5    6   10  [-5,-2,2,3,-3]

*/