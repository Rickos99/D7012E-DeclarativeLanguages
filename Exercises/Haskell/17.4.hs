scalarProducts :: Num a => [a] -> [a] -> a
scalarProducts a b = foldr (+) 0 (zipWith (*) a b) -- "foldr (+)" 0 could be replaced with sum
