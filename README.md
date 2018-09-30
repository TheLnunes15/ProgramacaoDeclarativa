# ProgramacaoDeclarativa

**Provas práticas da disciplina Programação Declarativa**

[**Primeira Unidade**] - *Haskell*
1. Processamento de Texto
*a)* Defina uma função **fill :: String -> Int -> String** de modo que, dado um texto de entrada e um inteiro N, retorna o texto original dividido em linhas que têm no máximo N caracteres. A função deve remover todos os caracteres de espaço *(' ')*, tabulações *('\t')* e quebras de linha *('\n')* do texto original e colocar apenas um espaço entre palavras de uma mesma linha, cada linha, com exceção da última, deve terminar com uma quebra de linha.
*b)* Defina uma função **just :: String -> Int -> String** que funciona de modo similar à função fill do item anterior, com a exceção de que agora todas as linhas devem ter exatamente N caracteres, com exceção da última.
*c)* Defina uma função **stat :: String -> (Int, Int, Int)** que recebe um texto e retorna o número de caracteres (sem contar espaços, tabulações e quebras de linha), palavras e linhas.
*d)* Defina uma função **index :: String -> [(String, [Int])]** que recebe um texto como entrada e retorna um índice das palavras deste texto. O índice é uma lista de tuplas onde cada tupla é composta por dois elementos: o primeiro é uma palavra e o segundo é uma lista com os números das linhas onde a palavra ocorre. O índice deve estar em ordem alfabética (você escolhe se vai diferencias maiúsculas de minúsculas ou não).
*e)* Defina uma função **subst :: String -> String -> String -> String** que recebe como entrada um texto, um termo a ser procurado e um novo termo que vai substituir a primeira
ocorrência do termo procurado no texto.
2. Assuma que uma imagem é representada como uma lista de listas de inteiros, sendo as listas internas as linhas da imagem e cada elemento das listas internas representa o valor de intensidade
do pixel . Defina uma função **rot :: [[Int]] -> [[Int]]** que gira a imagem 90 graus.
3. (extra) Esse é um clássico da computação. O objetivo é colocar N rainhas em um tabuleiro N por N de modo que nenhuma rainha esteja na mesma linha, coluna ou diagonal das outras. Defina uma função **queen :: Int -> [Int]** que, dado o tamanho do tabuleiro, retorna uma solução do problema.

[**Segunda Unidade**] - *Prolog e Haskell*
**1. Prolog:**
Implemente os seguintes métodos de ordenação em Prolog:
*a)* Quicksort
*b)* Insertion Sort
*c)* Bubble Sort
Cada um implementado como um predicado que recebe uma lista e retorna a lista ordenada. Nomes utilizados: **qSort(X,Y)**, **iSort(X,Y)**, **bSort(X,Y)** onde Y é a lista X ordenada.

**2. Prolog e Haskell:**
*a)* Transposição - **trans(A,Y)**
*b)* Multiplicação - **mult(A,B,Y)**
*c)* Inversão - **inv(A,Y)**


