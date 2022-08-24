# paradigmas-programacao-final

## Benchmark de algoritmos de ordenação em haskell

Benchmark dos algoritmos QuickSort, SelectionSort, MergeSort top Down, MergeSort Bottom Up usando a library Criterion com listas randomicas de tamanhos de 100 e 400 itens. 

## Como executar?
Para simplesmente executar : 
* `stack run`


Para compilar com uma saida em html dos relatorios: 
* `stack build`
* Após isso basta ver o caminho do arquivo compilado e executar `./caminho-arquivo --output Nome de saida.html`
* Exemplo: `./.stack-work/install/x86_64-linux-tinfo6/82bf3e181e505b2809d19a751250626e660de3524339401d848ba6907f20e338/9.0.2/bin/paradigmas-programacao-final --output SortingAlgos.html`

Exemplo de saida no terminal: 
```
benchmarking Sorting Algorithms/QuickSort 100 benchmark
time                 15.16 μs   (15.13 μs .. 15.20 μs)
                     1.000 R²   (1.000 R² .. 1.000 R²)
mean                 15.14 μs   (15.12 μs .. 15.16 μs)
std dev              64.37 ns   (50.07 ns .. 88.05 ns)

benchmarking Sorting Algorithms/QuickSort 400 benchmark
time                 71.21 μs   (70.85 μs .. 71.49 μs)
                     1.000 R²   (1.000 R² .. 1.000 R²)
mean                 70.57 μs   (70.39 μs .. 70.78 μs)
std dev              657.0 ns   (556.5 ns .. 850.8 ns)

benchmarking Sorting Algorithms/MergeSort Top Down 100 benchmark
time                 39.23 μs   (39.01 μs .. 39.54 μs)
                     1.000 R²   (0.999 R² .. 1.000 R²)
mean                 39.38 μs   (39.17 μs .. 39.70 μs)
std dev              839.5 ns   (620.9 ns .. 1.128 μs)
variance introduced by outliers: 18% (moderately inflated)

benchmarking Sorting Algorithms/MergeSort Top Down 400 benchmark
time                 213.0 μs   (209.4 μs .. 216.3 μs)
                     0.998 R²   (0.998 R² .. 0.999 R²)
mean                 209.3 μs   (207.5 μs .. 212.0 μs)
std dev              7.580 μs   (6.069 μs .. 10.20 μs)
variance introduced by outliers: 33% (moderately inflated)

benchmarking Sorting Algorithms/MergeSort Bottom Up 100 benchmark
time                 21.73 μs   (21.57 μs .. 21.94 μs)
                     0.999 R²   (0.999 R² .. 1.000 R²)
mean                 21.71 μs   (21.60 μs .. 21.86 μs)
std dev              434.7 ns   (338.2 ns .. 594.2 ns)
variance introduced by outliers: 18% (moderately inflated)

benchmarking Sorting Algorithms/MergeSort Bottom Up 400 benchmark
time                 90.20 μs   (89.78 μs .. 90.75 μs)
                     1.000 R²   (1.000 R² .. 1.000 R²)
mean                 90.36 μs   (89.92 μs .. 90.82 μs)
std dev              1.438 μs   (1.183 μs .. 1.869 μs)
variance introduced by outliers: 10% (moderately inflated)

benchmarking Sorting Algorithms/Selection Sort 100 benchmark
time                 100.9 ns   (100.1 ns .. 101.7 ns)
                     1.000 R²   (0.999 R² .. 1.000 R²)
mean                 100.5 ns   (100.0 ns .. 101.2 ns)
std dev              1.942 ns   (1.487 ns .. 2.663 ns)
variance introduced by outliers: 26% (moderately inflated)

benchmarking Sorting Algorithms/Selection Sort 400 benchmark
time                 100.9 ns   (100.3 ns .. 101.3 ns)
                     1.000 R²   (1.000 R² .. 1.000 R²)
mean                 101.7 ns   (100.9 ns .. 102.5 ns)
std dev              2.642 ns   (2.202 ns .. 3.114 ns)
variance introduced by outliers: 39% (moderately inflated)
```

## Entendendo os dados dos gráficos
Abaixo do gráfico de cada benchmark há uma pequena tabela de informações que se parece com isso.

```
                            limite inferior     estimativa      limite superior
Regressão OLS               31,0 ms             37,4 ms         42,9 ms
R² qualidade de ajuste      0,887               0,942           0,994
Tempo médio de execução     34,8 ms             37,0 ms         43,1 ms
Desvio padrão               2,11 ms             6,49 ms         11,0 ms
```

As duas primeiras linhas são os resultados de uma regressão linear executada nas medições exibidas no gráfico à direita.
A **"regressão OLS"** estima o tempo necessário para uma única execução da atividade que está sendo avaliada, usando um modelo de regressão de mínimos quadrados comum. Esse número deve ser semelhante à linha "tempo médio de execução" algumas linhas abaixo. A estimativa OLS geralmente é mais precisa do que a média, pois elimina com mais eficiência a sobrecarga de medição e outros fatores constantes.

**"R² goodness-of-fit"** é uma medida da precisão com que o modelo de regressão linear se ajusta às medidas observadas. Se as medições não forem muito ruidosas, R² deve ficar entre 0,99 e 1, indicando um excelente ajuste. Se o número estiver abaixo de 0,99, algo está confundindo a precisão do modelo linear. Um valor abaixo de 0,9 é totalmente preocupante.

**"Tempo médio de execução"** e "Desvio padrão" são estatísticas calculadas (mais ou menos) a partir do tempo de execução dividido pelo número de iterações.

## Lendo a saída da linha de comando

Antes de examinar os relatórios HTML, você provavelmente começará inspecionando o relatório que o critério imprime na janela do seu terminal.

```
benchmarking            ByteString/HashMap/random
tempo                   4,046 ms (4,020 ms .. 4,072 ms)
                        1.000 R² (1.000 R² .. 1.000 R²)
média                   4,017 ms (4,010 ms .. 4,027 ms)
std dev                 27,12 μs (20,45 μs .. 38,17 μs)
```
A primeira coluna é um nome; a segunda é uma estimativa. O terceiro e quarto, entre parênteses, são os limites inferior e superior de 95% da estimativa.

**time** corresponde ao campo *"regressão OLS"* na tabela HTML acima.

**R²** é a métrica de qualidade de ajuste para o tempo.

**média e std dev** têm os mesmos significados que *"Tempo médio de execução"* e *"Desvio padrão"* na tabela HTML.
## Referencias
* Thomas H. Cormen, Charles E. Leiserson, Ronald L. Rivest, and Clifford Stein. 2009. Introduction to Algorithms, Third Edition (3rd. ed.). The MIT Press.
* https://functional-algorithms-verified.org/functional_algorithms_verified.pdf
* Demais estão no relatório em pdf