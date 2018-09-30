cont :: String -> Int -> Int --obtem a palavra e retorna n caracteres
cont [] n = n
cont (x:xs) n | (x /= '\n' && x/= '\t' && x /= ' ') = cont xs (n+1)
                            | otherwise = cont xs n

contCh :: String -> Int
contCh x = cont x 0

confirma :: Char -> Bool --recebe um caractere e retorna "true" se ele for uma letra
confirma x | ( (n >= 65 && n <= 90) || (n >= 97 && n <= 122) ) = True
                          | otherwise = False
           where n = fromEnum x

contPalavra :: String -> Char -> Int -> Int
contPalavra [] _ n = n
contPalavra (x:xs) flag n | (flag == ' ' && confirma x) = contPalavra xs 'E' (n+1)
                          | (x == '\n' || x == ' ' || x == ',' || x == '.'|| x == '\t') = contPalavra xs ' ' n
                          | otherwise = contPalavra xs flag n                       

palavras :: String -> Int
palavras x = contPalavra x ' ' 0

linhas :: String -> Int -> Int --funcao para contar N linhas
linhas [] n = n
linhas (x:xs) n | (x == '\n') = linhas xs (n+1)
                                | otherwise = linhas xs n

contLinhas :: String -> Int
contLinhas [] = 0
contLinhas x = linhas x 1

stat :: String -> (Int, Int, Int)
stat x = (contCh x, palavras x, contLinhas x)
