curr :: ((a, b) -> c) -> a -> b -> c

-- failed
--curr f = \ x y -> f x y

-- failed
-- curr f = \ x y -> f

-- correct
curr f = \ x y -> f (x, y)

-- failed
--curr f = \ (x, y) -> f x y