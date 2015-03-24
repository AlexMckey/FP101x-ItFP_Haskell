safetail1 xs = if null xs then [] else tail xs

safetail2 [] 		= []
safetail2 (_ : xs) 	= xs

safetail3 (_ : xs) 
	| null xs 	= []
	| otherwise = tail xs

safetail4 xs
	| null xs 	= []
	| otherwise = tail xs

safetail5 xs
	| length xs == 0 	= []
	| otherwise 		= tail xs

safetail6 xs = tail xs
safetail6 [] = []

safetail7 [] = []
safetail7 xs = tail xs

safetail8 [x] 		= [x]
safetail8 (_ : xs) 	= xs