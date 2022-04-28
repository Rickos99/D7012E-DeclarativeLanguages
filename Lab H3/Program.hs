module Program (T, parse, fromString, toString, exec) where

import qualified Dictionary
import Parser hiding (T)
import qualified Statement
import Prelude hiding (fail, return)

newtype T = Program [Statement.T]

instance Parse T where
  parse = iter Statement.parse >-> Program
  toString (Program stmts) = concat [Statement.toString stmt | stmt <- stmts]

exec :: T -> [Integer] -> [Integer]
exec (Program stmts) inputs = Statement.exec stmts Dictionary.empty inputs
