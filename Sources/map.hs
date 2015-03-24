ma :: (a -> b) -> [a] -> [b]

-- failed
--ma f = foldr (\ x xs -> xs ++ [f x]) []

-- failed
--ma f = foldr (\ x xs -> f x ++ xs) []

-- failed
--ma f = foldl (\ xs x -> f x : xs) []

-- correct
ma f = foldl (\ xs x -> xs ++ [f x]) []