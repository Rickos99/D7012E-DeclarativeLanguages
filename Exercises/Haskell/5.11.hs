matches :: Int -> [Int] -> [Int]
matches x xs = [n | n <- xs, n == x]

elem1 :: Int -> [Int] -> Bool
elem1 x xs = not(null(matches x xs))

-- or --

elem2 :: Int -> [Int] -> Bool
elem2 x xs = x `elem` xs