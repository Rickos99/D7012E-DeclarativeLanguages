import CoreParser (Parser, (!), (#), (#>), (>->), (?))
import CoreParser hiding (char, lit)
import Data.Char
import Parser (accept, err)

-- Exercise 1
semicolon :: Parser Char
semicolon = char ? (== ';')

-- Exercise 2
mergetwo :: (a, a) -> [a]
mergetwo (a, b) = [a, b]

becomes :: Parser String
becomes = (char # char) ? (== (':', '=')) >-> mergetwo

-- Exercise 3
char :: Parser Char
char [] = Nothing
char (x : xs) = Just (x, xs)

-- Exercise 4
letter :: Parser Char
letter = char ? isAlpha

space :: Parser Char
space = char ? isSpace

-- Exercise 5
alphanum :: Parser Char
alphanum = char ? (\x -> isDigit x || isAlpha x)

-- Exercise 6
lit :: Char -> Parser Char
lit c = char ? (== c)

semicolon2 :: Parser Char
semicolon2 = lit ';'

-- Exercise 7
twochars :: Parser (Char, Char)
twochars = char # char

becomes2 :: Parser (Char, Char)
becomes2 = twochars ? (== (':', '='))

-- Exercise 8
toUpper' :: Parser Char
toUpper' = char ? isAlpha >-> toUpper

-- Exercise 9
sndchar :: Parser Char
sndchar = twochars >-> snd

-- Exercise 10
twochars2 :: Parser String
twochars2 = char # char >-> mergetwo

-- Exercise 11
(-#) :: Parser a -> Parser b -> Parser b
(-#) m n = m # n >-> snd

-- Exercise 12
(#-) :: Parser a -> Parser b -> Parser a
(#-) m n = m # n >-> fst

-- Exercise 13
-- Consider "a ! b", if a succeds, its result will be the result. Thus b is not considered.

-- Exercise 15
require :: String -> Parser String
require w = accept w ! err (w ++ " missing")
