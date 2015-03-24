import Data.Char

toDigits :: Integer -> [Integer]
toDigits = map (toInteger . digitToInt) . show

eval xs = foldl (\x y -> y + (10 * x)) 0 xs
-- Checks
checkEval n = n == eval (toDigits n)
checkAll n = all (\d -> d >= 0 && d < 10) (toDigits n)

toDigitsRev :: Integer -> [Integer]
toDigitsRev = reverse . toDigits

evalRev xs = foldr (\x y -> x + (10 * y)) 0 xs
-- Checks
checkEvalRev n = evalRev (toDigitsRev n) == n
checkAllRev n = all (\d -> d >= 0 && d < 10) (toDigitsRev n)

doubleSecond :: [Integer] -> [Integer]
doubleSecond  = zipWith (*) (cycle [1,2])

-- Checks
checkDoubleSecond = doubleSecond [8, 7, 6, 5] == [8, 14, 6, 10]

sumDigits :: [Integer] -> Integer
sumDigits xs = sum (map (uncurry (+) . (`divMod` 10)) xs)

-- Checks
checkSumDigits1 = sumDigits [8,14,6,10] == 20
checkSumDigits2 = sumDigits [3,9,4,15,8] == 30

isValid :: Integer -> Bool
isValid = (0 ==) . (`mod` 10) . sumDigits . doubleSecond . toDigitsRev