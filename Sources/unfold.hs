unfold :: (b -> Bool) -> (b -> a) -> (b -> b) -> b -> [a]

unfold p h t x
	| p x = []
	| otherwise = h x : unfold p h t (t x)

type Bit = Int

int2bin :: Int -> [Bit]
int2bin 0 = []
int2bin n = n `mod` 2 : int2bin (n `div` 2)

int2binCompact :: Int -> [Bit]
int2binCompact = unfold (== 0) (`mod` 2) (`div` 2)

chop8 :: [Bit] -> [[Bit]]
chop8 [] = []
chop8 bits = take 8 bits : chop8 (drop 8 bits)

chop8Unfold :: [Bit] -> [[Bit]]

-- failed
--chop8Unfold = unfold [] (take 8) (drop 8)

-- correct
chop8Unfold = unfold null (take 8) (drop 8)

-- failed
--chop8Unfold = unfold null (drop 8) (take 8)

ma :: (a -> b) -> [a] -> [b]

-- failed
--ma f = unfold null (f) tail

-- failed
--ma f = unfold null (f (head)) tail

-- correct 
ma f = unfold null (f . head) tail

-- failed
--ma f = unfold empty (f . head) tail

iterat :: (a -> a) -> a -> [a]

-- correct
iterat f = unfold (const False) id f

-- failed
--iterat f = unfold (const False) f f

-- false
--iterat f = unfold (const True) id f

-- failed
--iterat f = unfold (const True) f f