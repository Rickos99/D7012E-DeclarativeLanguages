iter :: Int -> (a -> a) -> a -> a
iter n f x
  | n < 0 = error "n cannot be smaller than 0"
  | n == 0 = x
  | otherwise = f (iter (n -1) f x)

square :: Int -> Int
square x = x ^ 2

rotateLeft :: String -> String
rotateLeft (x : xs) = xs ++ [x]
rotateLeft _ = ""

main = do
  putStr "(((3 ^ 2) ^ 2) ^ 2) ^ 2 = "
  print (iter 4 square 3)

  putStr "rotate \"haskell\" 7 times = "
  print (iter 2 rotateLeft "haskell")

  print ""
