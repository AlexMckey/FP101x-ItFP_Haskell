import Data.List
import Data.Char
import Unsafe.Coerce

data Nat = Zero
		 | Succ Nat
		 deriving Show

integerToNat :: Integer -> Nat

-- correct
integerToNat 0 = Zero
integerToNat (n+1) = Succ (integerToNat n)

-- failed
--integerToNat 0 = Succ Zero
--integerToNat n = (Succ (integerToNat n))

-- failed
--integerToNat n = product [(unsafeCoerce c) :: Integer | c <- show n]

-- failed
--integerToNat n = integerToNat n

-- correct
--integerToNat (n+1) = Succ (integerToNat n)
--integerToNat 0 = Zero

-- correct
--integerToNat (n+1) = let m = integerToNat n in Succ m
--integerToNat 0 = Zero

-- failed
--integerToNat = head . m
--	where
--		{
--		; m 0 = [0]
--		; m (n+1) = [sum [x | x <- (1 : m n)]]
--		}

-- failed
--integerToNat = \ n -> genericLength [c | c <- show n, isDigit c]