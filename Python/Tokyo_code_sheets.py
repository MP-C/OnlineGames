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



#### 4 Completar o exercício aqui
matriz = [ 
    [1, 1, 1],
    [2, 2, 7],
    [3, 3, 9],
    [4, 4, 13]
]

for sublista in matriz:
    elemento_somado = sum(sublista)
    sublista.append(elemento_somado)

print(matriz)

cavaleiro = { 'vida':2, 'ataque':2, 'defesa': 2, 'alcance':2 }
guerreiro = { 'vida':2, 'ataque':2, 'defesa': 2, 'alcance':2 }
arqueiro  = { 'vida':2, 'ataque':2, 'defesa': 2, 'alcance':2 }

# Completar o exercício aqui
cavaleiro = { 'vida':guerreiro['vida']*2, 'ataque':2, 'defesa': guerreiro['defesa']*2, 'alcance':2 }
guerreiro = { 'vida':2, 'ataque':cavaleiro['ataque']*2, 'defesa': 2, 'alcance':cavaleiro['alcance']*2 }
arqueiro  = { 'vida':guerreiro['vida'], 'ataque':guerreiro['ataque'], 'defesa': int(guerreiro['defesa']/2), 'alcance':guerreiro['alcance']*2 }

print(cavaleiro)
print(guerreiro)
print(arqueiro)


#### 5 Completar o exercício aqui
l=[[1,2,3],[4,5,6]]
t=([1,2,3],[4,5,6])
s={1,2,3,4,5,6}
print(type(l))
print(type(t))
print(type(s))


#### 6 Completar o exercício aqui
#1
numero_1=(input("Insira um número:"))
print("1º Numero :", numero_1)
print("Tipo de 1º Numero :", type(numero_1),"\n")

#2
numero_2=int(input("Insira outro número:"))
print("2º Numero :", numero_2)
print("Tipo de 2º Numero :", type(numero_2),"\n")

numero_3=float(input("Insira o último número:"))
print("3º Numero :", numero_3)
print("Tipo de 3º Numero :", type(numero_3),"\n")
