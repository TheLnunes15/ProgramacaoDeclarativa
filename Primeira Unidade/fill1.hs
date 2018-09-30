import Prelude as Prelude

encaixa :: String -> String -> Int -> Bool --retorna "true" se a palavra encaixa dentro da linha
encaixa palavra linha n |(areaLinha >= tam) = True
                                                       | otherwise = False
                       where tam = (Prelude.length palavra) + 1 --acrescenta +1 no tamanho da palavra
                             tamLinha = (Prelude.length linha) 
                             areaLinha = (n - tamLinha)

organiza :: [String] -> [String] -> Int -> [String] --recebe lista de palavras do texto e lista para guardar saida
organiza [] lista _ = lista
organiza (x:xs) lista n | (lista == []) = organiza xs (lista ++ [x]) n
                                                  | (ok == True) = organiza xs [(y ++ " " ++ x)] n
                                                  | otherwise = y : organiza (x:xs) ys n
                              where y  = head lista
                                    ys = tail lista
                                    ok = encaixa x y n              
                              
concatena :: String -> [String] -> String --concatenacao dos elementos da lista 
concatena texto [] = texto
concatena texto (x:xs) | (xs /= []) = concatena (texto ++ (x ++ "\n")) xs
                                                    | otherwise  = texto ++ x --no caso da ultima linha

fill :: String -> Int -> String
fill [] _ = []
fill texto n = fim
               where lista = Prelude.words texto --recebe lista com as palavras do texto
                     textoObtido = organiza lista [] n
                     fim = concatena [] textoObtido
