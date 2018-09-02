zeros :: Int -> [Int] --funcao que retona um array de tamanho N com zeros
zeros 0 = []
zeros size = [0] ++ (zeros (size-1))

exibe str = putStrLn (show str)

espaco :: Char -> Bool -- verifica se tem algum tipo de espaco no char
espaco ch =  ch == '\n' || ch == ' ' || ch == '\r' || ch == '\t' || ch == '\v' || ch == '\f' 

--funcao que retorna o tamanho de uma lista qualquer
tam :: [a] -> Int --retorna o tamanho da lista
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

concatena :: [Char] -> [[Char]] -> Int -> [Char] --concatena as listas de caracteres sem ultrapassar o limite.
concatena str mtx size
  | ((tam novo) - 1) < size = novo ++ " " ++ (just tail_mtx_list size)
  | ((tam novo) - 1) == size = novo ++ "\n" ++ (just tail_mtx_list size)
  | otherwise = str ++ "\n" ++ (just mtx_list size)
  where
    fst_mtx = head mtx
    tail_mtx = tail mtx
    novo = str ++ " " ++ fst_mtx
    mtx_list = lista mtx
    tail_mtx_list = lista tail_mtx

just :: [Char] -> Int -> [Char]
just [] _ = []
just _ 0 = []
just str size | ((tam (tudo) == 1) || (tam str <= size)) = str
              | (((tam fsnd)-1) <= size) = (concatena fsnd scalda size)
              | otherwise = fcabeca ++ ['\n'] ++(just fcaldaLista size)
  where
    tudo = palavra str
    fcabeca = (head tudo)
    fcalda = (tail tudo)
    fcaldaLista = (lista (tail tudo))
    scalda = (tail fcalda)
    scabeca = (head fcalda)
    fsnd = fcabeca ++ " " ++ scabeca
