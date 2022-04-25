data Expr
  = Lit Int
  | Add Expr Expr
  | Sub Expr Expr

size :: Expr -> Int
size (Lit x) = 0
size (Add ex1 ex2) = 1 + size ex1 + size ex2
size (Sub ex1 ex2) = 1 + size ex1 + size ex2
