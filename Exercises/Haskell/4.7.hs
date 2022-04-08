multiplication :: Int -> Int -> Int
multiplication a b
    | b == 0 = 0
    | otherwise = a + multiplication a (b-1)
