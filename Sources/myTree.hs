data Tree a = Leaf
			| Node (Tree a) a (Tree a)

--repeat :: a -> [a]
--repeat x = xs
--	where
--		xs = x : xs

repeatTree :: a -> Tree a

-- failed
--repeatTree x = Node x x x

-- correct
repeatTree x = Node t x t
	where
		t = repeatTree x

-- failed
--repeatTree x = repeatTree (Node Leaf x Leaf)

-- failed
--repeatTree x = Node t x t
--	where
--		t = repeatTree (Node t x t)