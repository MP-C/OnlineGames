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



#### 7 Completar o exercício aqui
welcome="Olá Mundo"
#1 Alinhado à direita em 20 caracteres
print(f"{'':>20},{welcome}")

#2 Trucate com indice
print(welcome[:3])

#3 Alinhamento ao centro em 20 caracteres com truncagem no segundo carácter
#print(f"{'':^20}{welcome}")
print(welcome[:1].center(20," "))

#4 format 5 int com 0 
numero_1 = 150
print('{:0>5}'.format(numero_1))

#5 format 7 int com ' '
numero_2 = 7887
print('{:' '>7}'.format(numero_2))

#6 format 3 int + 3 float
numero_3 = 20.02
numero_3 = '{:.03f}'.format(numero_3)
numero_3 = '{:0>3}'.format(numero_3)
print(numero_3)

#6 or
numero_3 = 20.02
print('{:03.3f}'.format(numero_3))


#### 8 Completar o exercício aqui
def obter_numero(mensagem):
    print(mensagem)
    numero = int(input())
    return numero

a = obter_numero("Introduz um numero:")
if a != 0:
    b = obter_numero("Introduz um numero:")
    c = obter_numero("Introduz um numero:")

    if(a<b<c):
        print("Ordem ascendente")
    elif(a>b>c):
        print("Ordem descendente")
    elif(b==0):
        if(a<c):
            print("Ordem ascendente")
        elif(a>c):
            print("Ordem descendente")
    else:
        print("Sem ordem")
        
else:
    print("Erro. O primeiro numero não pode ser 0.")



#### 9 Completar o exercício aqui
max_numero=int(input("Quantos numeros quer somar, entre 0-x? x = a valor maximo."))
iterator = 0
total= 0

for i in range(max_numero):
    total = total + i
    i=i+1
print("Total:", total)


#### 10 Completar o exercício aqui
def intro_dois_numeros_validos(mensagem):
    numero = int(input(mensagem))
    if numero > 0:
        return numero
    else:
        print("Numero não válido")

primeiro = intro_dois_numeros_validos("Introduz um numero maior que 0:")

segundo = intro_dois_numeros_validos("Introduz um numero menor que o anterior:")
if(segundo>primeiro):
    print("O segundo numero deveria ser menor que o primeiro")
else:
    print("A soma dos numeros introduzidos:", primeiro+segundo)
    print("O resto da subtração dos dois numeros introduzidos:{primeiro} - {segundo}:", primeiro-segundo)
    print("A multiplicação dos dois numeros introduzidos:", primeiro * segundo)



#### 11 Completar o exercício aqui
status = True
while status:
    numero = int(input("Introduz um numero"))
    
    if numero % 2 != 0:
        print("Numero introduzido:", numero)
    else:
        status = False


#### 12 Completar o exercício aqui
numbers = range(0,100,1)
total = sum(numbers)
print(total)



#### 13 Completar o exercício aqui
def obter_numero(mensagem):
    print(mensagem)
    numero = int(input())
    return numero

status = True
while status:
    numero_inteiro = obter_numero("Introduz um numero de 0-9")
    lista_valida = (2,4,5,7)
    if numero_inteiro in lista_valida:
        print("Numero existe na lista")
        status = False


#### 14 Completar o exercício aqui
#1
print(list(range(0,11,1)))

#2
print(list(range(-10,1,1)))

#3
print(list(range(0,22,2)))

#4
print(list(range(-19,0,1)))

#5
print(list(range(0,55,5)))



##### 15 Completar o exercício aqui
lista_1 = ["o",'l','a',' ', 'm','u','n','d','o']
lista_2 = ["o",'l','a',' ', 'l','u','a'] 
lista_3 = []

lista_3 = list(set(lista_1) - set(lista_2))
print(lista_3)


##### 16 Completar o exercício aqui
def introduzir_valor(mensagem):
    '''Para obter vários numeros'''
    numero = int(input(mensagem))
    return numero

def calcular_area(base, altura):
    '''Para calcular area'''
    resultado = base*altura
    print("A área é: ", resultado)

print("Calcular a area de um retangulo:")
base = introduzir_valor("Introduz uma base:")
altura = introduzir_valor("Introduz uma altura:")
calcular_area(base, altura)



##### 17 Completar o exercício aqui
import math
def introduzir_valor(mensagem):
    '''Para obter vários numeros'''
    numero = int(input(mensagem))
    return numero

def calcular_area(raio):
    '''Para calcular area'''
    resultado = math.pi * raio
    print("A área é: ", resultado)

raio = introduzir_valor("Introduz um raio:")
calcular_area(raio)


##### 18 Completar o exercício aqui
def obter_numero(mensagem):
    numero = int(input())
    return numero

def comparar_numeros(a,b):
    if(a>b):
        print("1")
    elif(a<b):
        print("-1")
    elif(a==b):
        print("0")

comparar_numeros(5,10)
comparar_numeros(10,5)
comparar_numeros(5,5)

primeiro = obter_numero("Introduz um numero:")
segundo = obter_numero("Introduz um numero:")
comparar_numeros(primeiro,segundo)



#### 19 Completar o exercício aqui
def ler_numero(mensagem):
    print(mensagem)
    numero = int(input())
    return numero

def maior(a,b,c):
    if(a>b and a>c):
        print("O maior numero é:", a)
    elif(b>c and b>a):
        print("O maior numero é:", b)
    elif(c>b and c>a):
        print("O maior numero é:", c)
    else:
        print("Sem ordem")

a = ler_numero("Introduz um numero:")
b = ler_numero("Introduz um numero:")
c = ler_numero("Introduz um numero:")
maior(a,b,c)

### 20 Completar o exercício aqui
def pedir_medidas(mensagem):
    print(mensagem)
    numero = float(input())
    print(numero)
    return numero

def imc(p,a):
    resultado = p/(a*a)
    if resultado < 18.50:
        return "Baixo peso"
    elif  resultado >= 18.50 and resultado < 25.00:
        return "Normal"
    elif  resultado >= 25.00 and resultado < 30.00:
        return "Sobrepeso"
    elif  resultado >= 30.00:
        return "Obesidade"
    else:
        return "Erro de calculo"


peso = pedir_medidas("Introduza o seu peso [kg]:")
altura = pedir_medidas("Introduza a sua altura [m] (max duas casas décimais): ")
print("O indice massa corporal é de", imc(peso,altura))


### 21  Fazer o exercício aqui
# Crie uma classe chamada Ponto com os atributos X e Y.
class Ponto():
    X = ''
    Y = ''

    # Adicione um construtor que inicialize X e Y com valores padrão zero.
    def __init__(self, X=0, Y=0) :
        self.X = X
        self.Y = Y

    # Implemente o método __str__ para exibir o ponto no formato (X,Y).
    def __str__(self):
        return (f"{self.X}, {self.Y}")

    def quadrante(self):
        print(self)
        if self.X == 0 and self.Y == 0 : return "Origem"
        elif self.X > 0 and self.Y > 0 : return "Primeiro Quadrante"
        elif self.X < 0 and self.Y > 0 : return "Segundo Quadrante"
        elif self.X < 0 and self.Y < 0 : return "Terceiro Quadrante"
        elif self.X > 0 and self.Y < 0 : return "Quarto Quadrante"

    # * Adicione um método vetor que recebe outro objeto ponto e calcula o vetor resultante entre os dois objetos pontos.
    def vetor(self, Ponto_B): # AB=(x2−x1,y2−y1)
        return abs(Ponto_B.X - self.X), abs(Ponto_B.Y - self.Y)

# --- Testes ---
#Criar os pontos A(2, 3), B(5,5), C(-3, -1) e D(0,0).
A = Ponto(2,3)
B = Ponto(5,5)
C = Ponto(-3,-1)
D = Ponto (0,0)

# Verifique a que quadrantes pertencem os pontos A, C e D.
print(A.quadrante())
print(B.quadrante())
print(C.quadrante())
print(D.quadrante())

# Calcule os vetores AB e BA e exiba os resultados.
print(f"Vetor AB ({B} - {A}) = {A.vetor(B)}")
print(f"Vetor BA ({A} - {B}) = {B.vetor(A)}")



### 22  Fazer o exercício aqui
# ----- IMPLEMENTAÇÃO -----
class Retangulo():
    ponto_inicial = ''
    ponto_final = ''

    def __init__(self, ponto_inicial=0, ponto_final=0):
        self.ponto_inicial = ponto_inicial
        self.ponto_final = ponto_final
    
    def base(self):
        return abs(self.ponto_inicial.X - self.ponto_final.X)

    def altura(self):
        return abs(self.ponto_inicial.X - self.ponto_final.Y)
    
    def area(self):
        return self.base() * self.altura()


# ----- EXECUÇÃO E TESTE -----
A = Ponto(2,3)
B = Ponto(5,5)
meu_retangulo = Retangulo(A,B)

print("--- Calculos de dimensões---")
base = meu_retangulo.base()
print("A base é : ", base)

altura = meu_retangulo.altura()
print("A altura é : ", altura)

area = meu_retangulo.area()
print("A área é : ", area)



### 23  Fazer o exercício aqui
# ----- IMPLEMENTAÇÃO
class Veiculo():
    def __init__(self, cor, rodas):
        self.cor = str(cor)
        self.rodas = int(rodas)
    
    def __str__(self):
        return f"\tCor: {self.cor} - \tRodas: {self.rodas}"

class Carro (Veiculo):
    def __init__(self, cor, rodas, velocidade, cilindrada):
        super().__init__(cor, rodas)
        self.velocidade = int(velocidade)
        self.cilindrada = float(cilindrada)
    
    def __str__(self):
        return f"Carro: Cor: {self.cor} \t- Rodas: {self.rodas} \t- Velocidade: {self.velocidade}km/h \t- Cilindrada: {self.cilindrada}L"

class Bicicleta (Veiculo):
    # Bicicletas não costumam ter cilindrada, mas mantive o mesmo principio, pois, as eletricas terão uma capacidade também
    def __init__(self, cor, rodas, velocidade, cilindrada=0):
        super().__init__(cor, rodas)
        self.velocidade = int(velocidade)
        self.cilindrada = float(cilindrada)
    
    def __str__(self):
        return f"Bicicleta: Cor: {self.cor} \t- Rodas: {self.rodas} \t- Velocidade: {self.velocidade}km/h \t- Cilindrada: {self.cilindrada}L"

class Moto (Veiculo):
    def __init__(self, cor, rodas, velocidade, cilindrada):
        super().__init__(cor, rodas)
        self.velocidade = int(velocidade)
        self.cilindrada = float(cilindrada)
    
    def __str__(self):
        return f"Moto: Cor: {self.cor} \t- Rodas: {self.rodas} \t- Velocidade: {self.velocidade}km/h \t- Cilindrada: {self.cilindrada}L"

class Camiao (Veiculo):
    def __init__(self, cor, rodas, velocidade, cilindrada):
        super().__init__(cor, rodas)
        self.velocidade = int(velocidade)
        self.cilindrada = float(cilindrada)
    
    def __str__(self):
        return f"Camião: Cor: {self.cor} \t- Rodas: {self.rodas} \t- Velocidade: {self.velocidade}km/h \t- Cilindrada: {self.cilindrada}L"

class Concessionario():
    def __init__(self):
        self.lista_veiculos = []

    def catalogar(self, lista_veiculos):
        self.lista_veiculos = lista_veiculos
    
    def filtrar(self, tipo_veiculo):
        """Filtra e retorna os veículos do tipo especificado da lista catalogada."""
        filtro = []
        for veiculo in self.lista_veiculos:
            if type(veiculo).__name__ == tipo_veiculo:
                filtro.append(veiculo) 
        return filtro


# ----- EXECUÇÃO -----
lista_veiculos=[]

Carro1 = Carro("vermelho", 4, 180, 2.4)
Carro2 = Carro("azul", 4, 150, 1.4)
print(Carro1)
lista_veiculos.append(Carro1)
lista_veiculos.append(Carro2)

Bicicleta1 = Bicicleta("preto", 2, 20) # Não precisa de cilindrada
Bicicleta2 = Bicicleta("preto", 2, 40)
print(Bicicleta1)
lista_veiculos.append(Bicicleta1)
lista_veiculos.append(Bicicleta2)

Moto1 = Moto("branco", 2, 180, 0.8)
Moto2 = Moto("preto", 2, 240, 1.2)
print(Moto1)
lista_veiculos.append(Moto1)
lista_veiculos.append(Moto2)

Camiao1 = Camiao("vermelho", 8, 90, 15)
Camiao2 = Camiao("amarelo", 8, 110, 20)
print(Camiao1)
lista_veiculos.append(Camiao1)
lista_veiculos.append(Camiao2)


# ----- TESTE -----
print("\n--- Catálogo e Filtro ---")
Concessionario_CarrosUsados = Concessionario()
Concessionario_CarrosUsados.catalogar(lista_veiculos)
filtro = Concessionario_CarrosUsados.filtrar("Carro") 

print(f"Veículos encontrados ({len(filtro)}):")
for veiculo in filtro:
    print(f"- {veiculo}")


### 24  Fazer o exercício aqui
class GerenciadorLista:
    def __init__(self, lista_inicial=None):
        if lista_inicial is None:
            self.lista = []
        else:
            self.lista = list(lista_inicial)
        
    def adicionar_elemento(self, elemento):
        try: 
            print(f"\nA tentar adicionar: {elemento}")
            if elemento not in self.lista:
                self.lista.append(elemento)
                print(f"Elemento '{elemento}' adicionado com sucesso.")
                print(f"Conteúdo atual da lista: {self.lista}")
            else:
                raise ValueError(f"Erro: Impossível adicionar elementos duplicados => [{elemento}].")
        except:
                print(f"Item duplicated : {elemento}. Não adicionado.")

# --- Implementação ---
gerenciador = GerenciadorLista()
print(f"Lista Inicial: {gerenciador.lista}")
gerenciador.adicionar_elemento(10)
gerenciador.adicionar_elemento(-2)
gerenciador.adicionar_elemento("Olá")

# --- Teste de erro ---
gerenciador.adicionar_elemento("Olá")

