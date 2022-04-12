-- From "9.9.hs"
iter :: Int -> (a -> a) -> a -> a
iter n f x
  | n < 0 = error "n cannot be smaller than 0"
  | n == 0 = x
  | otherwise = f (iter (n -1) f x)

powerOfTwo :: Int -> Int
powerOfTwo 0 = 1
powerOfTwo n = iter (n -1) (* 2) 2
