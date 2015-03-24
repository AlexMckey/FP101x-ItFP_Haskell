foldl_1 f a bs = foldr (\b -> \g -> (\a -> g (f a b))) id bs a

foldl_2 f a bs = foldr (\a b -> f b a) a bs

foldl_3 f = flip $ foldr (\a b g -> b (f g a)) id

foldl_4 = foldr . flip