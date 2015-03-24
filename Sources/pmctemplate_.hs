{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE Rank2Types #-}

module Lab5 where

import Control.Monad
import Control.Monad.Trans

data FreeF f a x = Pure a | Free (f x)

newtype FreeT f m a =
    FreeT { runFreeT :: m (FreeF f a (FreeT f m a)) }

instance (Functor f, Monad m) => Monad (FreeT f m) where
    return a = FreeT (return (Pure a))
    FreeT m >>= f = FreeT $ m >>= \v -> case v of
        Pure a -> runFreeT (f a)
        Free w -> return (Free (fmap (>>= f) w))

instance MonadTrans (FreeT f) where
    lift = FreeT . liftM Pure

liftF :: (Functor f, Monad m) => f r -> FreeT f m r
liftF x = FreeT (return (Free (fmap return x)))

--data Concurrent a = Concurrent ((a -> ActionF) -> ActionF)
data Concurrent a = Concurrent ((Monad m) => Action m a)

--data Action 
--    = Atom (IO Action)
--    = Atom Action
--    | Fork Action Action
--    | Stop

data ActionF next = Fork  next next
                  | Atom next
                  | Stop
                  deriving (Functor)
    
--instance Show ActionF where
--    show (Atom x) = "atom"
--    show (Fork x y) = "fork " ++ show x ++ " " ++ show y
--    show Stop = "stop"

type Action = FreeT ActionF

-- ===================================
-- Ex. 0
-- ===================================

action :: Concurrent a -> ActionF
action = error "You have to implement action"


-- ===================================
-- Ex. 1
-- ===================================

stop :: Concurrent a
stop = liftF Stop


-- ===================================
-- Ex. 2
-- ===================================

atom :: IO a -> Concurrent a
atom = error "You have to implement atom"


-- ===================================
-- Ex. 3
-- ===================================

fork :: Concurrent a -> Concurrent ()
fork = error "You have to implement fork"

par :: Concurrent a -> Concurrent a -> Concurrent a
par = error "You have to implement par"


-- ===================================
-- Ex. 4
-- ===================================

instance Monad Concurrent where
    (Concurrent f) >>= g = error "You have to implement >>="
    return x = Concurrent (\c -> c x)


-- ===================================
-- Ex. 5
-- ===================================

roundRobin :: [ActionF] -> IO ()
roundRobin = error "You have to implement roundRobin"

-- ===================================
-- Tests
-- ===================================

ex0 :: Concurrent ()
ex0 = par (loop (genRandom 1337)) (loop (genRandom 2600) >> atom (putStrLn ""))

ex1 :: Concurrent ()
ex1 = do atom (putStr "Haskell")
         fork (loop $ genRandom 7331) 
         loop $ genRandom 42
         atom (putStrLn "")


-- ===================================
-- Helper Functions
-- ===================================

run :: Concurrent a -> IO ()
run x = roundRobin [action x]

genRandom :: Int -> [Int]
genRandom 1337 = [1, 96, 36, 11, 42, 47, 9, 1, 62, 73]
genRandom 7331 = [17, 73, 92, 36, 22, 72, 19, 35, 6, 74]
genRandom 2600 = [83, 98, 35, 84, 44, 61, 54, 35, 83, 9]
genRandom 42   = [71, 71, 17, 14, 16, 91, 18, 71, 58, 75]

loop :: [Int] -> Concurrent ()
loop xs = mapM_ (atom . putStr . show) xs

