import Data.List
import Data.Char
import Unsafe.Coerce

data Nat = Zero
		 | Succ Nat
		 deriving Show

natToInteger :: Nat -> Integer
natToInteger Zero = 0
natToInteger (Succ n) = natToInteger n + 1

integerToNat :: Integer -> Nat
integerToNat 0 = Zero
integerToNat (n+1) = Succ (integerToNat n)

add :: Nat -> Nat -> Nat

-- correct
--add Zero n = n
--add (Succ m) n = Succ (add n m)

-- correct
--add (Succ m) n = Succ (add n m)
--add Zero n = n

-- failed
--add Zero n = Zero
--add (Succ m) n = Succ (add m n)

-- failed
--add (Succ m) n = Succ (add m n)
--add Zero n = Zero

-- correct
--add Zero n = n
--add (Succ m) n = Succ (add m n)

-- correct
add n (Succ m) = Succ (add m n)
add n Zero = n

-- Checks
checkAddNat m n = natToInteger(add (integerToNat m) (integerToNat n)) == m + n
checkAll = and [checkAddNat 0 0, checkAddNat 0 6, checkAddNat 5 6, checkAddNat 5 0]