composeList1 :: [(a -> a)] -> (a -> a)
composeList1 [] = id
composeList1 (f : fs) = f . composeList1 fs

-- or --

composeList2 :: [(a -> a)] -> (a -> a)
composeList2 = foldr (.) id
