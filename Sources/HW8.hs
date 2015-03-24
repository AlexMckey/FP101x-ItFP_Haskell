putStr' :: String -> IO ()
putStr' [] = return ()
putStr' (x:xs) = putChar x >> putStr' xs

putStrLn' :: String -> IO ()

-- correct
--putStrLn' [] = putChar '\n'
--putStrLn' xs = putStr' xs >> putStrLn' ""

-- correct
putStrLn' [] = putChar '\n'
putStrLn' xs = putStr' xs >> putChar '\n'

-- correct
--putStrLn' [] = putChar '\n'
--putStrLn' xs = putStr' xs >>= \ x -> putChar '\n'

-- failed
--putStrLn' [] = putChar '\n'
--putStrLn' xs = putStr' xs >> \ x -> putChar '\n'

-- correct
--putStrLn' [] = putChar '\n'
--putStrLn' xs = putStr' xs >> putStr' "\n"

-- failed
--putStrLn' [] = putChar '\n'
--putStrLn' xs = putStr' xs >> putStrLn' "\n"

-- other failed

getLine' :: IO String

-- failed
--getLine' = get ""
--get :: String -> IO String
--get xs = do
--			x <- getChar
--			case x of
--				' ' -> return xs
--				'\n' -> return xs
--				_ -> get (xs ++ [x])

-- failed
--getLine' = get ""
--get :: String -> IO String
--get xs = do
--			x <- getChar
--			case x of
--				'\n' -> return xs
--				_ -> get (x:xs)

-- correct
getLine' = get []
get :: String -> IO String
get xs = do
			x <- getChar
			case x of
				'\n' -> return xs
				_ -> get (xs ++ [x])

-- failed
--getLine' = get []
--get :: String -> IO String
--get xs = do
--			x <- getChar
--			case x of
--				'\n' -> return (x:xs)
--				_ -> get (xs ++ [x])

sequence_' :: Monad m => [m a] -> m ()

-- failed
--sequence_' [] = return []
--sequence_' (m : ms) = m >>= \ _ -> sequence_' ms

-- correct
--sequence_' [] = return ()
--sequence_' (m : ms) = (foldl (>>) m ms) >> return ()

-- failed
--sequence_' ms = foldl (>>) (return ()) ms

-- correct
--sequence_' [] = return ()
--sequence_' (m : ms) = m >> sequence_' ms

-- correct
--sequence_' [] = return ()
--sequence_' (m : ms) = m >>= \ _ -> sequence_' ms

-- failed
--sequence_' ms = foldr (>>=) (return ()) ms

-- correct
sequence_' ms = foldr (>>) (return ()) ms

sequence' :: Monad m => [m a] -> m [a]

-- 
sequence' [] = []
sequence' (m:ms) = m >>= \ a -> do
									as <- sequence' ms
									return (a : as)