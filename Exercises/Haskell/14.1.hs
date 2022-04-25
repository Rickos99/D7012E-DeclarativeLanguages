data Temp = Cold | Hot
  deriving (Show)

data Season = Spring | Summer | Autumn | Winter
  deriving (Eq)

weather :: Season -> Temp
weather season
  | season == Summer = Hot
  | otherwise = Cold
