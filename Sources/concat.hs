import Prelude hiding (concat)

concat :: [[a]] -> [a]

-- failed
--concat [] = []
--concat (xs : xss) = xs : concat xss

-- ocrrect
--concat [] = []
--concat (xs : xss) = xs ++ concat xss

-- failed
--concat [] = [[]]
--concat (xs : xss) = xs ++ concat xss

-- failed
concat [[]] = []
concat (xs : xss) = xs ++ concat xss