runningSums :: [Int] -> [Int]
runningSums [] = [0]
runningSums xs = runningSums (init xs) ++ [sum xs]

filteredRunningSums :: (Int -> Bool) -> [Int] -> [Int]
filteredRunningSums _ [] = [0]
filteredRunningSums f xs = [n | n <- xs, f n]
