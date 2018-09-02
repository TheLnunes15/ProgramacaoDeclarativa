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

espacos :: String -> Int -> Int
espacos x n = (n - tamLinha)
                          where tamLinha = Prelude.length x

preencherLinha ::[String] -> [String] -> Int -> [String] --obtem linha como uma lista de strings com n espacos
preencherLinha x aux 0 = aux ++ x
preencherLinha (x:[]) aux n = preencherLinha (aux ++ [x]) [] n
preencherLinha (x:xs) aux n = preencherLinha xs (aux ++ [(x ++ " ")]) (n-1)

concatenando :: [String] -> String -> String --recebe uma lista de strings e concatena
concatenando [] aux = aux
concatenando (x:xs) aux = concatenando xs (aux ++ (x ++ " "))

unico :: [String] -> Bool --retorna "true" se a lista tiver um unico elemento
unico (x:xs) = xs == []

unicoPreenchido :: [String] -> Int -> [String] --preenche uma linha que obtem uma unica palavra
unicoPreenchido x 0 = x
unicoPreenchido (x:xs) n = unicoPreenchido ([(" "++x)] ++ xs) (n-1)

espacosAdicionados :: [String] -> [String] -> Int -> [String] --obtem uma linha como uma lista de strings e espacos
espacosAdicionados [] aux n = aux  
espacosAdicionados (x:[]) aux n = aux ++ [x] --evita espacos adicionados na ultima linha
espacosAdicionados (x:xs) aux n | (espAusente > 0 && linhaUnica == True) = espacosAdicionados xs (aux ++ linhaEspecial) n
                        | (espAusente > 0) = espacosAdicionados xs (aux ++ [linhaConcatenada]) n
                        | otherwise = espacosAdicionados xs (aux ++ [x]) n
                          where linha = Prelude.words x --separa a linha atual em lista de strings
                                espAusente = espacos x n --obtem n espacos que faltam para concluir a linha
                                linhaPreenchida = preencherLinha linha [] espAusente
                                linhaConcatenada = concatenando linhaPreenchida []
                                linhaUnica = unico linha
                                linhaEspecial = unicoPreenchido linha espAusente

just :: String -> Int -> String
just [] _ = []
just texto n = fim
          where 
                   lista = Prelude.words texto -- Recebe lista com palavras do texto
                   textoInicial = organiza lista [] n
                   textoObtido = espacosAdicionados textoInicial [] n
                   fim = concatena [] textoObtido
