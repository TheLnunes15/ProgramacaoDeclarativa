espaco :: Char -> Bool -- verifica se tem algum tipo de espaco no char.
espaco ch =  ch == '\n' || ch == ' ' || ch == '\r' || ch == '\t' || ch == '\v' || ch == '\f' 

tam :: [a] -> Int -- retorna o tamanho da lista
tam [] = 0
tam (x:xs) = (tam xs) + 1

palavra :: [Char] -> [[Char]] --retorna uma matriz de caracteres
palavra str = case dropWhile espaco str of
  "" -> []
  str' -> ch : palavra str''
    where (ch, str'') = break espaco str'

lista :: [[Char]] -> [Char] --obtem uma matriz de caracteres e retorna uma lista
lista [] = []
lista [a] = a
lista (x:xs) = x ++ " " ++ lista xs

concatena :: [Char] -> [[Char]] -> Int -> [Char]   -- concatena as listas de caracteres sem ultrapassar o limite.
concatena str mtx size
  | ((tam novo) - 1) < size = novo ++ " " ++ (fill tail_mtx_list size)
  | ((tam novo) - 1) == size = novo ++ "\n" ++ (fill tail_mtx_list size)
  | otherwise = str ++ "\n" ++ (fill mtx_list size)
  where
    fst_mtx = head mtx
    tail_mtx = tail mtx
    novo = str ++ " " ++ fst_mtx
    mtx_list = lista mtx
    tail_mtx_list = lista tail_mtx

fill :: [Char] -> Int -> [Char] -- obtem uma string, um tamanho e retorna as palavras impressas
fill [] _ = []
fill _ 0 = []
fill str size
  | ((tam (tudo) == 1) || (tam str <= size)) = str
  | (((tam fsnd)-1) <= size) = (concatena fsnd stail size)
  | otherwise = fcabeca ++ "\n" ++(fill fst_tail_list size)
  where
    tudo = palavra str
    fcabeca = (head tudo)
    ftail = (tail tudo)
    fst_tail_list = (lista (tail tudo))
    stail = (tail ftail)
    scabeca = (head ftail)
    fsnd =  fcabeca ++ " " ++ scabeca
    