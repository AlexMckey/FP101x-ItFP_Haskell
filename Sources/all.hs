al :: (a -> Bool) -> [a] -> Bool

-- correct
--al p xs = and (map p xs)

-- failed
--al p xs = map p (and xs)

-- correct
--al p = and . map p

-- correct
--al p = not . any (not . p)

-- failed
--al p = map p . and

-- correct
--al p xs = foldl (&&) True (map p xs)

-- failed
--al p xs = foldl (&&) False (map p xs)

-- 
al p = foldr (&&) True . map p