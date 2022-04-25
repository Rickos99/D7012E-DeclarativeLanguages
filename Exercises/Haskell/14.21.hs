data NTree
  = NilT
  | Node Int NTree NTree

left :: NTree -> NTree
left (Node _ t _) = t
left _ = NilT

right :: NTree -> NTree
right (Node _ _ t) = t
right _ = NilT
