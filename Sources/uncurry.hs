uncurr :: (a -> b -> c) -> (a, b) -> c

-- correct
uncurr f = \ (x, y) -> f x y

-- failed
--uncurr f = \ x y -> f (x, y)

-- failed
--uncurr f = \ (x, y) -> f

-- failed
--uncurr f = \ x y -> f