filterFirst :: (a -> Bool) -> [a] -> [a]
filterFirst _ [] = []
filterFirst p (x : xs)
  | p x = xs
  | otherwise = x : filterFirst p xs
