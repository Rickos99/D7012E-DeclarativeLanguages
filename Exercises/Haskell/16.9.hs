newtype Deque a = D [a] deriving (Show)

emptyQ :: Deque a
emptyQ = D []

isEmptyQ :: Deque a -> Bool
isEmptyQ (D []) = True
isEmptyQ _ = False

addHead :: a -> Deque a -> Deque a
addHead x (D xs) = D (x : xs)

addTail :: a -> Deque a -> Deque a
addTail x (D xs) = D (xs ++ [x])

remHead :: Deque a -> (a, Deque a)
remHead (D []) = error "Queue is empty"
remHead (D (x:xs)) = (x, D xs)

remTail :: Deque a -> (a, Deque a)
remTail (D []) = error "Queue is empty"
remTail (D xs) = (last xs, D $ init xs)
