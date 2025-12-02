### 1 Completar o exercício aqui
valor1 = float(input("Introduz um numero: "))
valor2 = float(input("Introduz outro numero: "))

# 1. Se os dois números são iguais (valor1 == valor2)
print(f"{valor1 == valor2}")

# 2. Se os dois números são diferentes (valor1 != valor2)
print(f"{valor1 != valor2}")

# 3. Se o primeiro é maior que o segundo (valor1 > valor2)
print(f"{valor1 > valor2}")

# 4. Se o primeiro é menor que o segundo (valor1 < valor2)
print(f"{valor1 < valor2}")


### 2 Completar o exercício aqui
#1
lista = ["monte", "estadio", "pista", "estrada", "estrada"]
tupla = ("monte", "estadio", "pista", "estrada", "estrada")

#2 
print("Isto é uma lista :", lista)
print("Isto é uma tupla :", tupla)

#3
print("2º elemento da lista: ", lista[1])
print("penultimo elemento da tupla: ", tupla[-2])

#4
lista[1]="novo terreno"

tupla_transformada = list(tupla)
tupla_transformada[2] = ("lago")
tupla = tuple(tupla_transformada)

#5
print("Isto é lista com 'novo terreno': ", lista)
print("Isto é tuple com 'lago': ", tupla)

#6
print("tamanho da list:", len(lista))
print("tamanho de tuple:", len(tupla))

#7
lista.append("estadio")

tupla_transformada = list(tupla)
tupla_transformada.append("pista")
tupla = tuple(tupla_transformada)

print("Lista com 'estádio' : ", lista)
print("Tuple com 'pista' :", tupla)

#8
lista.clear()

tupla_transformada = list(tupla)
tupla_transformada.clear()
tupla = tuple(tupla_transformada)

print("Isto é lista vazia: ", lista)
print("Isto é tuple vazio: ", tupla)


### 3  Completar o exercício aqui
#1
lista1 = ["monte", "estadio", "pista", "estrada", "estrada"]
um_set = set(lista1)

#2
dicionario = {"material": "pedómetro", "hidratação": "agua", "calçado":"sapatilhas","material": "pedómetro"}

#3
print("Isto é set: ", um_set)
print("Isto é dicionario: ", dicionario)

#4

dic = list(dicionario.keys())
print(dic[2])
print("Isto é dicionario sem elemento 3: ", dic)

#5 
lista1 = list(um_set)
lista1[1] = "olimpico"
print("Isto é set sem 'olimpico': ", set(lista1))

#6
print(len(um_set))
print(len(dicionario))

#7
print("estadio" in um_set)
print("material" in dicionario)


#8
um_set.add("rampa")
print("um_set: ",um_set)

dicionario["temporisador"] = "Garmin"
print("dicionario: ", dicionario)

#9
um_set.remove("pista")
dicionario.pop("material")

print("um_set: ",um_set)
print("dicionario: ", dicionario)