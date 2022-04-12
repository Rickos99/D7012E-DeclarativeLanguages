secs :: [Int] -> [Int]
secs = map sec1 . filter sec2
  where
    sec1 = (+ 1)
    sec2 = \x -> x + 1 > 0
