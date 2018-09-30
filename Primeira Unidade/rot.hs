muda :: [[a]] -> [[a]]
muda []             = []
muda ([]   : xs')   = muda xs'
muda ((x:xs) : xs') = (x : [p | (p:_) <- xs']) : muda (xs : [ q | (_:q) <- xs'])    

rot :: [[Int]] -> [[Int]]
rot = reverse . muda
