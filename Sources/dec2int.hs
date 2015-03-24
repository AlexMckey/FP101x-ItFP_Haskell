dec2int :: [Integer] -> Integer

-- failed
--dec2int = foldr (\ x y -> 10 * x + y) 0

-- failed
--dec2int = foldr (\ x y -> x + 10 * y) 0

-- correct
dec2int = foldl (\ x y -> 10 * x + y) 0

-- failed
--dec2int = foldr (\ x y -> 10 * x + y) 0