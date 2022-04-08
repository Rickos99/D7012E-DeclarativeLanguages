divisors :: Int -> [Int]
divisors a = [n | n <- [1 .. a], a `mod` n == 0]

isPrime :: Int -> Bool
isPrime a = length (divisors a) == 2

-- Solution from https://en.wikipedia.org/wiki/Primality_test#C#,_C++_&_C

fastIsPrime :: Int -> Bool
fastIsPrime n
  | n == 2 || n == 3 = True
  | n <= 1 || n `mod` 2 == 0 || n `mod` 3 == 0 = False
  | otherwise = fastIsPrimeAux n 5

fastIsPrimeAux :: Int -> Int -> Bool
fastIsPrimeAux n i
  | i ^ 2 > n = True
  | n `mod` i == 0 || n `mod` (i + 2) == 0 = False
  | otherwise = fastIsPrimeAux n (i + 6)
