showBoolFun :: (Bool -> Bool) -> String
showBoolFun f =
  " Input : Output" ++ "\n ......:......." ++ "\n True  : " ++ show (f True) ++ "\n False : " ++ show (f False)

showBoolFunGen :: Show a => (a -> String) -> (Bool -> a) -> String
showBoolFunGen f p = " Input : Output" ++ "\n ......:......." ++ "\n True  : " ++ f (p True) ++ "\n False : " ++ f (p False)
