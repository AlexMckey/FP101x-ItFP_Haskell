import Data.List
import Data.Char
import Unsafe.Coerce

data Nat = Zero
		 | Succ Nat
		 deriving Show

natToInteger :: Nat -> Integer

-- correct
natToInteger Zero = 0
natToInteger (Succ n) = natToInteger n + 1

-- correct
--natToInteger (Succ n) = natToInteger n + 1
--natToInteger Zero = 0

-- failed
--natToInteger n = natToInteger n

-- correct
--natToInteger (Succ n) = 1 + natToInteger n
--natToInteger Zero = 0

-- failed
--natToInteger Zero = 1
--natToInteger (Succ n) = (1 + natToInteger n) - 1

-- correct
--natToInteger = head . m
--	where
--		m Zero = [0]
--		m (Succ n) = [sum [ x | x <- (1 : m n)]]

-- correct
--natToInteger = \ n -> genericLength [c | c <- show n, c == 'S']

-- failed
--natToInteger = \ n -> length [c | c <- show n, c == 'S']