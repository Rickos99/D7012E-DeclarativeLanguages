import Data.List

factors :: Int -> [Int]
factors x = [n | n <- [1 .. x `div` 2], x `mod` n == 0] ++ [x]

primeFactors :: Int -> [Int]
primeFactors x = filter isPrime (factors x)
  where
    isPrime :: Int -> Bool
    isPrime n
      | n == 2 || n == 3 = True
      | n <= 1 || n `mod` 2 == 0 || n `mod` 3 == 0 = False
      | otherwise = isPrimeAux n 5
      where
        isPrimeAux :: Int -> Int -> Bool
        isPrimeAux n i
          | i ^ 2 > n = True
          | n `mod` i == 0 || n `mod` (i + 2) == 0 = False
          | otherwise = isPrimeAux n (i + 6)

hamming :: [Int]
hamming = [n | n <- [1 ..], isHamming n]
  where
    isHamming :: Int -> Bool
    isHamming n = null (primeFactors n \\ [2, 3, 5])
