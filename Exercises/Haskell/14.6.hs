data Shape = Circle Float | Rectangle Float Float | Triangle Float Float Float
  deriving (Eq, Ord, Show, Read)

isRegular :: Shape -> Bool
isRegular (Circle _) = True
isRegular (Rectangle w h) = w == h
isRegular (Triangle a b c) = a == b && b == c
