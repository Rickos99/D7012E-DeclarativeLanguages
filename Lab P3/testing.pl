:- ["othello", "testboards"].

%%%%%%%%%%%%%%%%%%%%%%%%% Test flankScore %%%%%%%%%%%%%%%%%%%%%%%%%
fscore(Direction, Plyr, Proposed, S) :-
  initBoard(State),
  flankScore(Direction, Plyr, State, Proposed, S), !.


%%%%%%%%%%%%%%%%%%%%%%%%% Test moves %%%%%%%%%%%%%%%%%%%%%%%%%
% Should be, Moves = [[1, 3], [2, 4], [3, 1], [4, 2]].
mtest1(Moves) :-
  initBoard(State),
  moves(1, State, Moves).

% Should be, Moves = [[1, 2], [2, 1], [3, 4], [4, 3], [4, 4]].
mtest2(Moves) :-
  testBoard4(State),
  moves(1, State, Moves).

% Should be, Moves = [n].
mtest3(Moves) :-
  testBoard5(State),
  moves(1, State, Moves).


%%%%%%%%%%%%%%%%%%%%%%%%% Test terminal %%%%%%%%%%%%%%%%%%%%%%%%%
% Should be, false.
termtest1 :- 
  testBoard1(State),
  terminal(State).

% Should be, true.
termtest2 :- 
  testBoard5(State),
  terminal(State).


%%%%%%%%%%%%%%%%%%%%%%%%% Test calcScore %%%%%%%%%%%%%%%%%%%%%%%%%
% Should be, [2,2]
cstest1([P1,P2]) :-
  initBoard(State),
  calcScore(State, P1, P2).

% Should be, [3,2]
cstest2([P1,P2]) :-
  testBoard4(State),
  calcScore(State, P1, P2).


%%%%%%%%%%%%%%%%%%%%%%%%% Test winner %%%%%%%%%%%%%%%%%%%%%%%%%
% Should be, false.
wtest1(Winner) :-
  initBoard(State),
  winner(State, Winner).

% Should be, Winner = 2
wtest2(Winner) :-
  testBoard5(State),
  winner(State, Winner).


%%%%%%%%%%%%%%%%%%%%%%%%% Test tie %%%%%%%%%%%%%%%%%%%%%%%%%
% Should be, false
titest1 :- 
  testBoard5(State),
  tie(State).

% Should be, true
titest2 :- 
  testBoard6(State),
  tie(State).


%%%%%%%%%%%%%%%%%%%%%%%%% Test nextState %%%%%%%%%%%%%%%%%%%%%%%%%
% Should be, NextPlyr = 2,
%     1 1 1 1 1 1 
%     2 1 1 1 1 1
%     1 2 1 1 2 1
%     1 1 1 1 1 2
%     1 1 1 1 1 1
%     1 1 1 1 1 2
nstest1(NextPlyr) :-
  testBoard7(State), 
  nextState(1, [2,3], State, NextState, NextPlyr), 
  showState(NextState).

% Should be, NextPlyr = 2,
%     . . . . . . 
%     . . . 1 . .
%     . . 1 1 . .
%     . . 2 1 . .
%     . . . . . .
%     . . . . . .
nstest2(NextPlyr) :- 
  initBoard(State), 
  nextState(1, [3,1], State, NextState, NextPlyr), 
  showState(NextState).

% Should be, NextPlyr = 1,
%     . . . . . . 
%     . . . . . .
%     . . 1 2 . .
%     . . 2 2 . .
%     . . . 2 . .
%     . . . . . .
nstest3(NextPlyr) :- 
  initBoard(State), 
  nextState(2, [3,4], State, NextState, NextPlyr), 
  showState(NextState).
