validateChar :: Char -> Bool
validateChar = \c -> not (c `elem` " \t\n")
