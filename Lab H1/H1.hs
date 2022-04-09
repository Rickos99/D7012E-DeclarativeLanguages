-- author: Rickard Bemm
-- date: 2022-04-09

data SubSet = SubSet
  { set_sum :: Int,
    start :: Int,
    end :: Int,
    set :: [Int]
  }
  deriving (Show)

-- Create subsets
subsetsOfList :: [Int] -> Int -> Int -> [SubSet]
subsetsOfList [] _ _ = []
subsetsOfList xs i j = subsetBase xs i j ++ subsetsOfList (tail xs) (i + 1) j

subsetBase :: [Int] -> Int -> Int -> [SubSet]
subsetBase [] _ _ = []
subsetBase xs i j = SubSet {set_sum = sum xs, start = i, end = j, set = xs} : subsetBase (init xs) i (j -1)

kSubSets :: [SubSet] -> Int -> [SubSet]
kSubSets _ 0 = []
kSubSets [] _ = []
kSubSets (x : xs) k = x : kSubSets xs (k -1)

-- Insertion sort
iSort :: [SubSet] -> [SubSet]
iSort [] = []
iSort (x : xs) = ins x (iSort xs)

ins :: SubSet -> [SubSet] -> [SubSet]
ins x [] = [x]
ins x (y : ys) = if set_sum x < set_sum y then x : y : ys else y : ins x ys

-- Sort and select subsets and print them
smallestKSets :: [Int] -> Int -> IO ()
smallestKSets [] _ = error "Set must be non-empty"
smallestKSets xs k
  | k > 0 = putStr (header ++ rows)
  | otherwise = error "K must be greater or equal to 1"
  where
    header = "size\ti\tj\tsublist\n"
    rows = (stringifySubsets (kSubSets (iSort (subsetsOfList xs 1 (length xs))) k))

-- Subsets to string, each subset on a new line
stringifySubsets :: [SubSet] -> String
stringifySubsets xs = unlines [string_format x | x <- xs]
  where
    string_format x = show (set_sum x) ++ "\t" ++ show (start x) ++ "\t" ++ show (end x) ++ "\t" ++ show (set x)

-- Test cases
testCase0 = smallestKSets [-1, 2, -3, 4, -5] 3
testCase1 = smallestKSets [x * (-1) ^ x | x <- [1 .. 100]] 15
testCase2 = smallestKSets [24, -11, -34, 42, -24, 7, -19, 21] 6
testCase3 = smallestKSets [] 1
testCase4 = smallestKSets [1, 2, 3, 4] 0
