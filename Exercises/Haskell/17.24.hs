runningSums :: [Int] -> [Int]
runningSums [] = [0]
runningSums xs = runningSums (init xs) ++ [sum xs]
