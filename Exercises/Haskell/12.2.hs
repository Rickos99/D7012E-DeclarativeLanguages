numEqual :: Eq a => [a] -> a -> Int
numEqual [] _ = 0
numEqual (x : xs) n
  | x == n = 1 + numEqual xs n
  | otherwise = numEqual xs n
