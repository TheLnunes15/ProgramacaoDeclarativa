type Matriz = [[Double]]

trans :: Matriz -> Matriz
trans ([]:_) = [] -- cauda da lista vazia e retorna somente "cabeca"
trans x = (map head x) : trans (map tail x) -- segue as "cabecas" das listas de modo recursivo ate chegar na matriz vazia

-- trans [[1,2,3],[4,5,6]]
