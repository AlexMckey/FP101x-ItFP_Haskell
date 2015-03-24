-- correct
--ad [] = True
--ad (b : bs) = b && ad bs

-- correct
--ad [] = True
--ad (b : bs)
--	| b = ad bs
--	| otherwise = False

-- failed
--ad [] = False
--ad (b : bs) = b && ad bs

-- failed
--ad [] = False
--ad (b : bs) = b || and bs

-- correct
--ad [] = True
--ad (b : bs)
--	| b == False = False
--	| otherwise = ad bs

-- failed
--ad [] = True
--ad (b : bs) = b || ad bs

-- correct
--ad [] = True
--ad (b : bs) = ad bs && b

-- failed
ad [] = True
ad (b : bs)
	| b = b
	| otherwise = ad bs