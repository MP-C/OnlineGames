'''
5 andares com 25 lugares / andar
3 lugares vip / andar
2 lugares handicap / andar
+ 10 lugares moto / andar 
'''

class Veiculo:
    preco_vip = 0.8

    def __init__(self, handicap, tipo, nome, identificador, preco, vip, data_in, data_out):
        self.handicap = handicap
        self.carro = tipo
        self.id = nome
        self.matricula = identificador
        self.preco = preco
        self.vip = vip
        self.data_in = data_in
        self.data_out = data_out
    
    def detallhes(carro, matricula, preco, data_in, data_out):
        print(carro, matricula, preco)

    def is_carro(handicap):
        return True

    def is_handicap(self):
        return self.handicap
    
    def is_vip(self):
        return self.vip

    def preco_pagar(preco_minuto, vip, data_in, data_out):
        tempo_estacionamento_min = (data_out - data_in).total_segundos() /60
        preco_final = 0
        if tempo_estacionamento_min <= 60 and vip == 0:
            preco_final = tempo_estacionamento_min * preco_minuto 
            return preco_final 
        elif tempo_estacionamento_min <= 60 and vip == 1:
            preco_final = tempo_estacionamento_min * (preco_minuto*vip)
            return preco_final 
        elif tempo_estacionamento_min > 60 and vip == 0:
            preco_final = tempo_estacionamento_min * preco_minuto 
            return preco_final
        elif tempo_estacionamento_min > 60 and vip == 1:
            preco_final = tempo_estacionamento_min * (preco_minuto*vip) 
            return preco_final
        if tempo_estacionamento_min > 180:
            preco_final = preco_final + 3
            return preco_final

class moto(Veiculo):
    def __init__(self, dimenssoes):
        self.dimenssoes = dimenssoes

class Carro(Veiculo):
    def __init__(self, dimenssoes):
        self.dimenssoes = dimenssoes
        
class Parking():
    andares = ["rdc","primeiro","segundo","terceiro","quarto"]
    
    def __init__(self, andares):
        self.andares = andares

    # def piso(self,veiculo,lugar):
    #     self.veiculo = veiculo
    #     self.lugar = lugar

    def esta_cheio(self, tipo):
        for andar in self.andares:
            if andar.full(tipo) == 1:
                pass
            else:
                return andar.nome
        return "Full"

    
    def andar_disponivel():
        pass

    def cliente_vip():
        pass
    
    def cliente_handicap():
        pass

    def calcular_tempo():
        pass

    def calcular_preco(tempo):
        pass

class Andar:
    lugares_carros = []
    lugares_motas = []
    
    estacionamento_andar = [lugares_carros,lugares_motas]

    def __init__(self, nome):
        self.nome = nome