'''
5 andares com 25 lugares / andar
3 lugares vip / andar
2 lugares handicap / andar
+ 10 lugares moto / andar 
'''

class Veiculo():
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
        tempo_estacionamento = data_out - data_in
        if tempo_estacionamento <= 60 and vip == 0:
            preco = tempo_estacionamento * preco_minuto 
            return preco 
        elif tempo_estacionamento <= 60 and vip == 1:
            preco = tempo_estacionamento * preco_minuto 
            return preco 
        elif tempo_estacionamento > 60 and vip == 0:
            preco = tempo_estacionamento * (preco_minuto*vip) 
            return preco
        elif tempo_estacionamento > 60 and vip == 1:
            preco = tempo_estacionamento * (preco_minuto*vip) 
            return preco


class moto(Veiculo):
    def __init__(self, dimenssoes):
        self.dimenssoes = dimenssoes

class Carro(Veiculo):
    def __init__(self, dimenssoes):
        self.dimenssoes = dimenssoes
        
class Parking():
    def __init__(self, veiculo):
        self.veiculo = veiculo

    def esta_cheio():
        pass
    
    def andar_disponivel():
        pass

    def client_vip():
        pass
    
    def client_handicap():
        pass

    def calcular_tempo():
        pass

    def calcular_preco(tempo):
        pass

class andar():
    def piso(self,veiculo,lugar):
        self.veiculo = veiculo
        self.lugar = lugar
    
