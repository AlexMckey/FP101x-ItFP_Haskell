import Prelude hiding ((^))

--  failed
--m ^ 0 = 0
--m ^ n = m * m ^ (n-1)

-- correct
--m ^ 0 = 1
--m ^ n = m * m ^ (n-1)

-- filed
--m ^ 0 = 1
--m ^ n = m * m ^ n - n-1

-- failed
--m ^ 0 = 1
--m ^ n = n * n ^ (m-1)

-- correct
--m ^ 0 = 1
--m ^ n = m * (^) m (n-1)

-- failed
--m ^ 0 = 1
--m ^ n = m * m * m ^ (n-2)

--
m ^ 0 = 1
m ^ n = (m * m) ^ (n-1)

--