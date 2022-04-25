data NTree
  = NilT
  | Node Int NTree NTree

isInTree :: NTree -> Int -> Bool
isInTree NilT _ = False
isInTree (Node v l r) n = v == n || isInTree l n || isInTree r n
