require "dijkstra.rb"

## Carregando arquivo para o vetor
arquivo = ARGV.first
string = File.readlines(arquivo)

## Lendo a origem e destino
origem = ARGV[1].to_i
destino = ARGV[2].to_i

## Criando a matriz
matriz = []
for i in (1..string.size)
	matriz[i] = []
end

## Convertendo as linhas da string em inteiros e colocando na matriz
i = 1
j = 1
string.each do |linha|
	numeros = linha.split(" ")
	numeros.each do |coluna|
		matriz[i][j] = coluna.to_i
		j += 1
	end
	j = 1
	i += 1
end

## Chamando o algoritmo de Dijkstra
if (origem > 0 && origem < matriz.size)
	if (destino > 0 && destino < matriz.size)
		dijkstra(origem,destino,matriz)
	end
end
