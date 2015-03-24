an :: (a -> Bool) -> [a] -> Bool

-- failed
--an p = map p . or

-- correct
--an p = or . map p

-- correct
--an p xs = length (filter p xs) > 0

-- correct
--an p = not . null . dropWhile (not . p)

-- failed
--an p = null . filter p

-- correct
--an p xs = not (all (\ x -> not (p x)) xs)

-- correct
--an p xs = foldr (\ x acc -> (p x) || acc) False xs

-- failed
an p xs = foldr (||) True (map p xs)