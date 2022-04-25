data NewShape = Circle Float Point | Rectangle Float Float Point | Triangle Float Float Float Point
  deriving (Eq, Ord, Show, Read)

data Point = Point Float Float
  deriving (Eq, Ord, Show, Read)

move :: Float -> Float -> NewShape -> NewShape
move dx dy (Circle r (Point x y)) = Circle r (Point (x + dx) (y + dy))
move dx dy (Rectangle w h (Point x y)) = Rectangle w h (Point (x + dx) (y + dy))
move dx dy (Triangle a b c (Point x y)) = Triangle a b c (Point (x + dx) (y + dy))
