-- Rickard Bemm

import Calculator

-- Part 1 and 2

testcaseExp :: Bool
testcaseExp = assert actual expected
  where
    actual = unparse (simplify (diff (Var "x") (parse "exp(x*x*x+2*x+34)")))
    expected = "(exp(((((x*x)*x)+(2*x))+34))*((((x+x)*x)+(x*x))+2))"

testcaseLn :: Bool
testcaseLn = assert actual expected
  where
    actual = unparse (simplify (diff (Var "x") (parse "ln(x*x*x+2*x+34)")))
    expected = "(((((x+x)*x)+(x*x))+2)/((((x*x)*x)+(2*x))+34))"

testcase1 :: Bool
testcase1 = assert actual expected
  where
    actual = unparse (simplify (diff (Var "x") (parse "ln(exp(sin(2*x)))")))
    expected = "((exp(sin((2*x)))*(cos((2*x))*2))/exp(sin((2*x))))"

testcase2 :: Bool
testcase2 = assert actual expected
  where
    actual = unparse (simplify (diff (Var "x") (parse "ln(exp(2*x))")))
    expected = "((exp((2*x))*2)/exp((2*x)))"

testcase3 :: Bool
testcase3 = assert actual expected
  where
    actual = unparse (simplify (diff (Var "x") (parse "ln(exp(sin(2*x)))*cos(2*x+x*x)")))
    expected = "((((exp(sin((2*x)))*(cos((2*x))*2))/exp(sin((2*x))))*cos(((2*x)+(x*x))))+(ln(exp(sin((2*x))))*((-1*sin(((2*x)+(x*x))))*(2+(x+x)))))"

-- Part 3

testcaseNR1 :: Bool
testcaseNR1 = assertRange actual expected precision
  where
    precision = 0.0001
    expected = 0.68232775
    actual = findzero "x" "x*x*x+x-1" 1

testcaseNR2 :: Bool
testcaseNR2 = assertRange actual expected precision
  where
    precision = 0.0001
    expected = 1.5707964
    actual = findzero "y" "cos(y)*sin(y)" 1

testcaseNR3 :: Bool
testcaseNR3 = assertRange actual expected precision
  where
    precision = 0.0001
    expected = 2.35619
    actual = findzero "x" "2*cos(2*x)*ln(x)" 2

testcaseNR4 :: Bool
testcaseNR4 = assertRange actual expected precision
  where
    precision = 0.0001
    expected = 1
    actual = findzero "x" "2*cos(2*x)*ln(x)" 1.5

-- Assertions

assert :: (Eq a, Show a) => a -> a -> Bool
assert actual expected
  | actual /= expected = error ("Assertion error expected: " ++ show expected ++ ", got: " ++ show actual)
  | otherwise = True

assertRange :: (Ord a, Num a, Show a) => a -> a -> a -> Bool
assertRange actual expected precision
  | abs (actual - expected) > precision = error ("Assertion error expected: " ++ show expected ++ ", got: " ++ show actual)
  | otherwise = True
