import Prelude hiding ((||))

-- correct
--False || False = False
--_ || _ = True

-- correct
--False || b = b
--True || _ = True

-- failed
--b || c
--	| b == c = True
--	| otherwise = False

-- correct
--b || c
--	| b == c = b
--	| otherwise = True

-- correct
--b || False = b
--_ || True = True

-- correct
--b || c
--	| b == c = c
--	| otherwise = True

-- failed
--b || True = b
--_ || True = True

-- correct
False || False = False
False || True = True
True || False = True
True || True = True