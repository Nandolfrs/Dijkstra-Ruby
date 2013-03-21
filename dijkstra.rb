def dijkstra (origem,destino,matriz)

	## Variaveis
	minimo = 1000000
	distancia = []
	antecessor = []
	processado = []

	## Inicializando nodos
	for i in (1..matriz.size-1)
		distancia[i] = 1000000
		antecessor[i] = -1
		processado[i] = false
	end

	## Nodo origem
	distancia[origem] = 0
	antecessor[origem] = -1
	processado[origem] = true

	## Encontrando menor caminho
	atual = origem
	while atual != destino
		for i in (1..matriz.size-1)
			if matriz[atual][i] != 0 && processado[i] != true
				if distancia[atual] + matriz[atual][i] < distancia[i]
					antecessor[i] = atual
					distancia[i] = distancia[atual] + matriz[atual][i]
				end
			end
		end
		minimo = 1000000
		for i in (1..matriz.size-1)
			if processado[i] == false && distancia[i] < minimo
				minimo = distancia[i]
				atual = i
			end
		end
		processado[atual] = true 
	end

	## Imprimindo resultados
	puts "\nOrigem: #{origem}"
	puts "Destino: #{destino}"
	puts "Custo: #{distancia[destino]}"
	print "Caminho: "

	## Montando caminho
	atual = destino
	k = 0
	imprime = []
	while atual != -1
		imprime[k] = atual
		atual = antecessor[atual]
		k += 1
	end
	for i in (0..imprime.size-2)
		k -= 1
		print "#{imprime[k]} -> "
	end
	k -= 1
	print "#{imprime[k]}"
	puts "\n\n"

end
