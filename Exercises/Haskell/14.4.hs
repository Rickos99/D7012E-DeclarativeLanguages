data Shape = Circle Float | Rectangle Float Float
  deriving (Eq, Ord, Show, Read)

perimeter :: Shape -> Float
perimeter (Circle r) = 2 * pi * r
perimeter (Rectangle w h) = (*) 2 (w + h)
