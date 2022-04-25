import Prelude hiding (Either, Left, Right)

data Either a b = Left a | Right b
  deriving (Eq, Ord, Read, Show)

twist :: Either a b -> Either b a
twist (Left a) = Right a
twist (Right b) = Left b
