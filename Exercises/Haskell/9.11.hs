sumOfSquares :: Int -> Int
sumOfSquares n = foldr (+) 0 (map (^ 2) [1 .. n])
