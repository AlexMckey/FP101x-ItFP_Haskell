double x = x + x

quadruple x = double (double x)

factorial n = product [1..n]

average ns = sum ns `div` length ns

last xs = head (reverse xs)

init xs = drop (length xs - 1) xs

qsort1 [] = []
qsort1 (x : xs) = qsort1 larger ++ [x] ++ qsort1 smaller
	where 
		smaller = [a | a <- xs, a <= x]
		larger = [b | b <- xs, b > x]

qsort2 [] = []
qsort2 (x : xs) = reverse (qsort2 smaller ++ [x] ++ qsort2 larger)
	where 
		smaller = [a | a <- xs, a <= x]
		larger = [b | b <- xs, b > x]

qsort3 [] = []
qsort3 xs = qsort3 larger ++ qsort3 smaller ++ [x]
	where
		x = minimum xs 
		smaller = [a | a <- xs, a <= x]
		larger = [b | b <- xs, b > x]