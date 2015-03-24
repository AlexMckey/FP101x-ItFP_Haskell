remove1 n xs = take n xs ++ drop n xs

remove2 n xs = drop n xs ++ take n xs

remove3 n xs = take (n + 1) xs ++ drop n xs

remove4 n xs = take n xs ++ drop (n+1) xs