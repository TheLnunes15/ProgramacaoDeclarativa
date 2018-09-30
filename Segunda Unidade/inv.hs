type Matriz = [[Double]]

tam :: Matriz -> Int -- define o tamanho 
tam = length

mapMat :: (Double -> Double) -> Matriz -> Matriz  -- mapeando a matriz.
mapMat f = map (map f)

regs :: Matriz -> [[(Int, Int)]]
regs = zipWith (map . (,)) [0..] . map (zipWith const [0..])

delMat :: Int -> Int -> Matriz -> Matriz -- faz uma limpeza na matriz
delMat i j = dellist i . map (dellist j)
  where
    dellist i xs = take i xs ++ drop (i + 1) xs

detm :: Matriz -> Double -- calcula o determinante.
detm m
    | tam m == 1 = head (head m)
    | otherwise    = sum $ zipWith add [0..] m
  where
    add i (x:_) =  x * cmplm i 0 m

cmplm :: Int -> Int -> Matriz -> Double -- complemento algebrico
cmplm i j m = ((-1.0) ** fromIntegral (i + j)) * detm (delMat i j m)

cmplmM :: Matriz -> Matriz
cmplmM m = map (map (\(i,j) -> cmplm j i m)) $ regs m

inv :: Matriz -> Matriz
inv m = mapMat (* recip det) $ cmplmM m
  where
    det = detm m

-- inv [[1,2,3],[4,5,6]]
