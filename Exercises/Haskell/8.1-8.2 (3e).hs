data Move = Rock | Paper | Scissors
  deriving (Show, Eq)

type Tournament = ([Move], [Move])

beat :: Move -> Move
beat Rock = Paper
beat Paper = Rock
beat Scissors = Rock

lose :: Move -> Move
lose Rock = Scissors
lose Paper = Rock
lose _ = Paper

outcome :: Move -> Move -> Int
outcome x y
  | lose x == y = 1
  | beat x == y = -1
  | otherwise = 0

tournamentOutcome :: Tournament -> Int
tournamentOutcome (x : xs, y : ys) = outcome x y + tournamentOutcome (xs, ys)
tournamentOutcome _ = 0
