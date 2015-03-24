filte :: (a -> Bool) -> [a] -> [a]

-- failed
--filte p = foldl (\ xs x -> if p x then x : xs else xs) []

-- correct
--filte p = foldr (\ x xs -> if p x then x : xs else xs) []

-- failed
--filte p = foldr (\ x xs -> if p x then xs ++ [x] else xs) []

-- failed
filte p = foldl (\ x xs -> if p x then xs ++ [x] else xs) []