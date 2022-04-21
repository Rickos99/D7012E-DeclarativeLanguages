oneLookupFirst :: Eq a => [ (a,b)] -> a -> b
oneLookupFirst [] _ = error "A tuple with such value could not be found"
oneLookupFirst ((f, s):xs) item 
  | f == item = s
  | otherwise = oneLookupFirst xs item

oneLookupSecond :: Eq b => [ (a,b)] -> b -> a
oneLookupSecond [] _ = error "A tuple with such value could not be found"
oneLookupSecond ((f, s):xs) item 
  | s == item = f
  | otherwise = oneLookupSecond xs item
