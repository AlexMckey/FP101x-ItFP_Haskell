fibs :: [Integer]

-- failed
--fibs = 1 : [x+y | (x,y) <- zip fibs (tail fibs)]

-- failed
-- fibs = 0 : 1 : zipWith (*) fibs (tail fibs)

-- failed
--fibs = 1 : 1 : [x+y | (x,y) <- zip (tail fibs) fibs]

-- correct
fibs = 0 : 1 : [x+y | (x,y) <- zip fibs (tail fibs)]

fib :: Int -> Integer

-- failed
--fib n = last (take n fibs)

-- failed
--fib n = head (drop (n-1) fibs)

-- correct
fib n = fibs !! n

-- failed
--fib n = index fibs n

largeFib :: Integer

-- correct
largeFib = head (dropWhile (<= 1000) fibs)

-- failed
--largeFib = last (take 19 fibs)

-- failed
--largeFib = filter (> 1000) fibs

-- failed
--largeFib = head (drop 1000 fibs)