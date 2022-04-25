data NewShape = Circle Float Point | Rectangle Float Float Point | Triangle Float Float Float Point
  deriving (Eq, Ord, Show, Read)

data Point = Point Float Float
  deriving (Eq, Ord, Show, Read)
