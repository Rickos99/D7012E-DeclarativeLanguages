import Data.List

subLists :: [a] -> [[a]]
subLists [] = [[]]
subLists (x : xs) = [x : sub | sub <- subLists xs] ++ subLists xs

subSequences :: Eq a => [a] -> [[a]]
subSequences [] = [[]]
subSequences xs = [x : ps | x <- xs, ps <- subSequences (xs \\ [x])]
