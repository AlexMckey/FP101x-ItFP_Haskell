import Prelude hiding ((&&))

-- correct
--True && True = True
--_ && _ = False

-- correct
--a && b = if a then if b then True else False else False

-- failed
--a && b = if not (a) then not (b) else True

-- failed
--a && b = if a then b

-- failed
--a && b = if a then if b then False else True else False

-- correct
--a && b = if a then b else False

-- correct
a && b = if b then a else False