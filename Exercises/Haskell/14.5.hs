data Shape = Circle Float | Rectangle Float Float | Triangle Float Float Float
  deriving (Eq, Ord, Show, Read)

area :: Shape -> Float
area (Circle r) = pi * r ^ 2
area (Rectangle w h) = w * h
area (Triangle a b c) = sqrt (s * (s + a) * (s - b) * (s - c))
  where
    s = (a + b + c) / 2

isRound :: Shape -> Bool
isRound (Circle _) = True
isRound _ = False

perimeter :: Shape -> Float
perimeter (Circle r) = 2 * pi * r
perimeter (Rectangle w h) = (*) 2 (w + h)
perimeter (Triangle a b c) = a + b + c
