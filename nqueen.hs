type Solution = [Int] --cria um tipo personalizado

-- funcao que verifica se ha choque em linha, coluna ou diagonal
extend :: Solution -> Int -> Maybe Solution --recebe uma lista de inteiros e um inteiro
extend solution new = go 0 solution --obtem a solucao e uma possível nova entrada
  where
    n = length solution --pega quantas solucoes ja existem
    go _ []  =  Just (solution ++ [new])--caso esteja vazia, isnere 
    go i (x:xs) 
      | x == new = Nothing--se a solucao de teste tiver como cabeca a posicao requerida, faz nada 
      | abs (i - n) == abs (x - new)  = Nothing--se (iteração menos tamanho da solução) for igual (posição fixada menos posição proposta), faz nada
      | otherwise = go (i+1) xs  -- caso contrario, verifica na proxima posicao

fullExtend :: Int -> Solution -> Maybe Solution -- recebe o tamanho do tabuleiro e uma solucao conhecida e retorna uma possivel solução
fullExtend n partialSolution-- recebe o tamanho da solução desejada e a solução parcial
  | length partialSolution == n = Just partialSolution -- se o tamanho da solução for o tamanho passado, retorna a solução
  | otherwise = foldr propose Nothing [0..(n-1)] -- de outra forma, concatena os elementos e aplica a função que verifica uma nova entrada
  where
    propose _ (Just xs) = Just xs--retorna a entrada
    propose x Nothing   = extend partialSolution x >>= fullExtend n --concatena as listas e retorna

queen :: Int -> Maybe Solution --assinatura da funcao que retorna a possivel resolucao
queen n = fullExtend n []