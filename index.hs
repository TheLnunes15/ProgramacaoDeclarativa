import Prelude as Prelude
import Data.Char as Char hiding (letra) 

remove :: String -> [String] -> [String] --remove da lista a primeira ocorrencia da string
remove _ [] = []
remove x (y:ys) | (x == y) = ys
                | otherwise = y : remove x ys

elementoMinimo :: String -> [String] -> String --retorna menor elemento
elementoMinimo menor [] = menor
elementoMinimo menor (x:xs) | (x < menor) = elementoMinimo x xs
                            | otherwise = elementoMinimo menor xs

ordena :: [String] -> [String] -> [String] --saida da lista ordenada
ordena [] lista = lista
ordena (x:xs) listOrd = ordena listDes (listOrd ++ [menor])
                         where menor = elementoMinimo x (x:xs)
                               listDes = remove menor (x:xs)

converte :: String -> String -> String --converte string para letras minusculas
converte [] novo = novo
converte (x:xs) novo = converte xs (novo ++ [Char.toLower x])

letra :: Char -> Bool --obtem um char e retorna "true" se ele for uma letra
letra x | ( (n >= 65 && n <= 90) || (n >= 97 && n <= 122) || (n >= 128 && n <= 165) || (n >= 48 && n <= 57) ) = True
        | otherwise = False
           where n = fromEnum x
 
checaLista :: String -> [String] -> Bool --retorna "true" se estiver na lista
checaLista _ [] = False
checaLista x (y:ys) | (x == y) = True
                    | otherwise = checaLista x ys

removeCaracteres :: String -> String -> String --saida de um string obtendo caracteres da string (com quebras de linha, espacos e tabulacoes)
removeCaracteres [] str = str
removeCaracteres (x:xs) str | (letra x == True || x == '\t' || x == '\n' || x == ' ') = removeCaracteres xs (str ++ [x])
                            | otherwise = removeCaracteres xs (str ++ " ") --o espaco eh considerado como pontuacao

percorreu :: String -> String -> Bool --retorna "true" se uma string esta contida em outra e retorna "false" se for ao contrario
percorreu x [] = False
percorreu str1 str2 = checaLista str1 y
                      where y = Prelude.words str2 --vira uma lista com palavras

separa :: String -> String -> [String] -> [String] --obtem o texto e retorna separado em linhas
separa [] aux lista = lista ++ [aux]
separa (x:xs) aux lista | (x == '\n') = separa xs [] (lista ++ [aux])
                        | otherwise = separa xs (aux ++ [x]) lista

ocorreu :: [String] -> String -> [Int] -> Int -> [Int] --retorna lista com linhas onde essa string ocorreu no texto
ocorreu [] _ ocorrencia _ = ocorrencia
ocorreu (x:xs) string ocorrencia linha | (checaLista string linhaTexto == True) = ocorreu xs string (ocorrencia ++ [linha]) (linha+1)
                                       | otherwise = ocorreu xs string ocorrencia (linha+1)
      where linhaTexto = Prelude.words x      

indices :: [String] -> [String] -> [(String, [Int])] -> String -> [(String, [Int])] --recebe lista de palavras a serem pesquisadas
indices _ [] lista _ = lista
indices linhas (x:xs) lista consultas | (percorreu x consultas == False) = indices linhas xs (lista ++ [(x,ocorreu linhas x [] 0)]) (consultas ++ " "++ x)
                                      | otherwise = indices linhas xs lista consultas

index :: String -> [(String, [Int])]
index x = indices linhas ordPalavras [] []
          where texto = converte x [] --converte para minusculas
                str = removeCaracteres texto [] --se nao for uma palavra ele remove
                palavras = Prelude.words str --obtem uma lista com palavras do texto
                ordPalavras = ordena palavras [] --recebe uma lista de palavras ordenadas
                linhas = separa str [] [] --converte o texto em uma lista, onde cada elemento da lista eh uma linha do texto
