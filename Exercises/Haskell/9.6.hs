square :: Int -> Int
square x = x ^ 2

sqList :: [Int] -> [Int]
sqList ns = [square n | n <- ns]

sumSq :: [Int] -> Int
sumSq (n : ns) = square n + sumSq ns
sumSq [] = 0

gtZero :: [Int] -> Bool
gtZero [] = False
gtZero [n] = 0 < n
gtZero (n : ns) = 0 < n && gtZero ns
