--halve1 xs = (take n xs, drop n xs)
--	where n = length xs / 2

halve2 xs = splitAt (length xs `div` 2) xs

halve3 xs = (take (n `div` 2) xs, drop (n `div` 2) xs)
	where n = length xs

halve4 xs = splitAt (length xs `div` 2)

halve5 xs = (take n xs, drop (n + 1) xs)
	where n = length xs `div` 2

halve6 xs = splitAt (div (length xs) 2) xs

--halve7 xs = splitAt (length xs / 2) xs

halve8 xs = (take n xs, drop n xs)
	where n = length xs `div` 2