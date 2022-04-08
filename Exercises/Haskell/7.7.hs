matches :: Int -> [Int] -> [Int]
matches x xs = [n | n <- xs, n == x]

unique :: [Int] -> [Int]
unique xs = [n | n <- xs, length (matches n xs) == 1]
