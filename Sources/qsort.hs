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

qsort4 [] = []
qsort4 (x : xs) = reverse (qsort4 smaller) ++ [x] ++ reverse (qsort4 larger)
	where 
		smaller = [a | a <- xs, a <= x]
		larger = [b | b <- xs, b > x]

qsort5 [] = []
qsort5 (x : xs) = qsort5 larger ++ [x] ++ qsort5 smaller
	where 
		larger = [a | a <- xs, a > x || a == x]
		smaller = [b | b <- xs, b < x]

qsort6 [] = []
qsort6 (x : xs) = qsort6 larger ++ [x] ++ qsort6 smaller
	where 
		smaller = [a | a <- xs, a < x]
		larger = [b | b <- xs, b > x]

qsort7 [] = []
qsort7 (x : xs) = reverse (reverse (qsort7 smaller) ++ [x] ++ reverse (qsort7 larger))
	where 
		smaller = [a | a <- xs, a <= x]
		larger = [b | b <- xs, b > x]

qsort8 [] = []
qsort8 xs = [x] : qsort8 larger ++ qsort8 smaller
	where
		x = maximum xs 
		smaller = [a | a <- xs, a < x]
		larger = [b | b <- xs, b >= x]