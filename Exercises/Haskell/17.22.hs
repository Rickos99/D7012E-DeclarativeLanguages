factorial :: [Int]
factorial = [foldr (*) 1 [1 .. n] | n <- [0 ..]]

fibonacci :: [Int]
fibonacci = 0 : 1 : zipWith (+) fibonacci (tail fibonacci)
