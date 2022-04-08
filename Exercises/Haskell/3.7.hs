threeDifferent :: Int -> Int -> Int -> Bool
threeDifferent a b c
  | a == b || a == c || b == c = False
  | otherwise = True
