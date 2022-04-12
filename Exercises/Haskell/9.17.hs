filterFirst :: (a -> Bool) -> [a] -> [a]
filterFirst _ [] = []
filterFirst p (x : xs)
  | p x = xs
  | otherwise = x : filterFirst p xs

filterLast :: (a -> Bool) -> [a] -> [a]
filterLast _ [] = []
filterLast p xs = reverse (filterFirst p (reverse xs))
