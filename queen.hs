import Data.List 
import Control.Monad
 {-- dado n rainhas resolve o problema retornando uma lista das 
 colunas onde as rainhas sao localizadas em cada linha --}
queen :: Int -> [[Int]]
queen n = map fst $ foldM rainhas ([],[1..n]) [1..n]  where
  rainhas (y,l) _ = [(x:y, delete x l) | x <- l, assegure x]  where  -- retorna uma lista de todos os arranjos de rainhas nas primeiras linhas (i + 1) e as escolhas restantes  
   assegure x = and [x /= col + n && x /= col - n | (n,col) <- zip [1..] y]  -- "safe x" testa-se uma dama na coluna x estara salvo das rainhas anteriores 

printSolution y = do 
     let n = length y
     mapM_ (\x -> putStrLn [if z == x then 'Q' else '.' | z <- [1..n]]) y
     putStrLn ""
 
main = mapM_ printSolution $ queen 4 -- imprime todas as solucoes para um exemplo com apenas 4 rainhas