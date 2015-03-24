last' :: [a] -> a
last' [x] = x
last' (_ : xs) = last xs

foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr' f v (x:xs) = f x (foldr' f v xs)
foldr' _ v [] = v

init' :: [a] -> [a]
init' [_] = []
init' (x:xs) = x : init xs

drop' :: Int -> [a] -> [a]
drop' 0 xs = xs
drop' _ [] = []
drop' n (_:xs) = drop (n-1) xs

(+++) :: [a] -> [a] -> [a]
(x:xs) +++ ys = x : (xs +++ ys)
[] +++ ys = ys

foldl' :: (a -> b -> a) -> a -> [b] -> a
foldl' f v (x:xs) = foldl' f (f v x) xs
foldl' _ v [] = v