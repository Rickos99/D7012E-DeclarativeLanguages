data Expr
  = Lit Int
  | Op Ops Expr Expr
  deriving (Show)

data Ops = Add | Sub | Mul | Div
  deriving (Eq, Show)

eval :: Expr -> Int
eval (Lit n) = n
eval (Op Add ex1 ex2) = eval ex1 + eval ex2
eval (Op Sub ex1 ex2) = eval ex1 - eval ex2
eval (Op Mul ex1 ex2) = eval ex1 * eval ex2
eval (Op Div ex1 ex2) = eval ex1 `div` eval ex2

size :: Expr -> Int
size (Lit x) = 0
size (Op _ ex1 ex2) = 1 + size ex1 + size ex2
