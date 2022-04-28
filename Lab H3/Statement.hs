module Statement (T, parse, toString, fromString, exec) where

import qualified Dictionary
import qualified Expr
import Parser hiding (T)
import Prelude hiding (fail, return)

type T = Statement

data Statement
  = Assignment String Expr.T
  | Skip
  | Begin [Statement]
  | If Expr.T Statement Statement
  | While Expr.T Statement
  | Read String
  | Write Expr.T
  deriving (Show)

-- SYNTAX: variable ':=' expr ';'
assignment :: Parser Statement
assignment = word #- accept ":=" # Expr.parse #- require ";" >-> buildAss
  where
    buildAss (v, e) = Assignment v e

-- SYNTAX: 'skip' ';'
skip :: Parser Statement
skip = accept "skip;" >-> buildSkip
  where
    buildSkip _ = Skip

-- SYNTAX: 'begin' statements 'end'
begin :: Parser Statement
begin = accept "begin" -# iter parse #- require "end" >-> buildBegin
  where
    buildBegin e = Begin e

-- SYNTAX: 'if' expr 'then' statement 'else' statement
if' :: Parser Statement
if' = accept "if" -# Expr.parse #- require "then" # parse #- require "else" # parse >-> buildIf
  where
    buildIf ((e, s1), s2) = If e s1 s2

-- SYNTAX: 'while' expr 'do' statement
while :: Parser Statement
while = accept "while" -# Expr.parse #- require "do" # parse >-> buildWhile
  where
    buildWhile (e, s) = While e s

-- SYNTAX: 'read' variable ';'
read' :: Parser Statement
read' = accept "read" -# word #- require ";" >-> buildRead
  where
    buildRead w = Read w

-- SYNTAX: 'write' expr ';'
write :: Parser Statement
write = accept "write" -# Expr.parse #- require ";" >-> buildWrite
  where
    buildWrite e = Write e

exec :: [T] -> Dictionary.T String Integer -> [Integer] -> [Integer]
exec (Assignment v e : stmts) dict input = exec stmts (Dictionary.insert (v, Expr.value e dict) dict) input
exec (Skip : stmts) dict input = exec stmts dict input
exec (Begin stmtsB : stmts) dict input = exec (stmtsB ++ stmts) dict input
exec (If cond thenStmts elseStmts : stmts) dict input =
  if (Expr.value cond dict) > 0
    then exec (thenStmts : stmts) dict input
    else exec (elseStmts : stmts) dict input
exec (While cond stmtsW : stmts) dict input =
  if (Expr.value cond dict) > 0
    then exec (stmtsW : While cond stmtsW : stmts) dict input
    else exec stmts dict input
exec (Read v : stmts) dict [] = error ("Input list was empty. Found no integers to read into" ++ v)
exec (Read v : stmts) dict (input : inputs) = exec stmts (Dictionary.insert (v, input) dict) inputs
exec (Write e : stmts) dict input = Expr.value e dict : exec stmts dict input
exec [] _ _ = [] -- End of instructions

instance Parse Statement where
  parse = assignment ! skip ! begin ! if' ! while ! read' ! write
  toString t = buildString t 0
    where
      buildString :: T -> Int -> String
      buildString ((Assignment v e)) indent = makeIndent indent ++ v ++ " := " ++ Expr.toString e ++ ";\n"
      buildString (Skip) indent = makeIndent indent ++ "Skip;\n"
      buildString ((Begin stmts)) indent = makeIndent indent ++ "begin\n" ++ concat [buildString stmt (indent + 1) | stmt <- stmts] ++ makeIndent indent ++ "end\n"
      buildString ((If e s1 s2)) indent = makeIndent indent ++ "if " ++ Expr.toString e ++ " then \n" ++ buildString s1 (indent + 1) ++ makeIndent indent ++ "else \n" ++ buildString s2 (indent + 1)
      buildString ((While e s)) indent = makeIndent indent ++ "while " ++ Expr.toString e ++ " do\n" ++ buildString s (indent + 1)
      buildString ((Read s)) indent = makeIndent indent ++ "read " ++ s ++ ";\n"
      buildString ((Write e)) indent = makeIndent indent ++ "write " ++ Expr.toString e ++ ";\n"

      makeIndent :: Int -> String
      makeIndent i = replicate indentSpaces ' '
        where
          indentSpaces = i * 2
