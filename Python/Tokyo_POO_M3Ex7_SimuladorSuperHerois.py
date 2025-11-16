'''
Criar um simulador de luta de super-heróis onde diferentes personagens podem lutar
entre si. Os super-heróis e vilões serão modelados como classes que implementam uma interface
comum para definir suas habilidades de luta


1) - Crie uma interface chamada Lutador com os seguintes elementos:
• Um método atacar que representa a ação de ataque do lutador.
• Um método defender que representa a ação de defesa do lutador.
• Um método obterVida que retorna a quantidade atual de pontos de vida do lutador.


2) - Crie várias classes de super-heróis e vilões, como Superman, Mulher-Maravilha, Thor, etc., que implementam a
interface Lutador. Cada classe deve definir suas próprias implementações dos métodos atacar, defender e obterVida.


3) - No programa principal, permita ao utilizador escolher dois personagens para uma luta. Os utilizadores podem alternar
entre os personagens e escolher ações de ataque e defesa para cada rodada.


4)- Implemente um sistema de combate onde os personagens atacam e defendem de acordo com suas próprias
habilidades definidas nas classes. O dano causado e a redução de dano na defesa podem ser calculados de acordo com
as implementações específicas de cada personagem.


5)- Exiba informações sobre o resultado de cada rodada de combate, incluindo a quantidade de vida restante de cada
personagem.


'''


from abc import ABC, abstractmethod
import random




# -- Classes --
# 1.
class Lutador(ABC) :
   def __init__(self, nome: str, ataque: int, defesa: int, obterVida: int):
       self._nome = nome
       self._ataque = ataque
       self._defesa = defesa
       self.__vida = obterVida # atributo modificado apenas por esta class / interface (privado)

   #1.1 método atacar que representa a ação de ataque do lutador
   @abstractmethod
   def ataque(self) -> int:
       pass # implementa em subclass

   #1.2 método defender que representa a ação de defesa do lutador
   @abstractmethod
   def defender(self) -> int:
       pass # implementa em subclass

   #1.3 método obterVida que retorna a quantidade atual de pontos de vida do lutador
   def obter_vida(self) -> int:
       return self.__vida # implementa em subclass

   #4. O dano causado e a redução de dano na defesa podem ser calculados....
   # Para aplicar Dano
   def receber_dano(self, dano: int) -> None:
       self.__vida -= dano
       if self.__vida<0:
           self.__vida = 0
       # implementa em subclass

   def get_nome(self):
       return self._nome

# 2. Cria várias classes de super-heróis e vilões, que implementam a Lutador.
# Cada classe deve definir suas próprias implementações dos métodos atacar, defender e obterVida.
class Aleatorio(Lutador):
   def __init__(self):
       super().__init__("Heroi desconhecido", (random.randint(10,80)), (random.randint(1,20)), (random.randint(12,60)))

   # Base + Fator de Sorte
   def ataque(self) -> int:
       return self._ataque #+ random.randint(3, 11)

   def defender(self) -> int:
       return self._defesa #+ random.randint(1, 9)


class SuperMan(Lutador):
   def __init__(self):
       # Chama o construtor da classe base com os valores específicos => Vida alta, Dano alto
       super().__init__("Super-Homem", 75, 50, 80)

   # Base + Fator de Sorte
   def ataque(self) -> int:
       return self._ataque #+ random.randint(5, 15)

   def defender(self) -> int:
       # Fator de Sorte
       return self._defesa #+ random.randint(10, 20)


class CapitaoAmerica(Lutador):
   def __init__(self):
       # Chama o construtor da classe base com os valores específicos => Vida alta, Dano alto
       super().__init__("Capitão America", 45, 20, 80)

   # Base + Fator de Sorte
   def ataque(self) -> int:
       return self._ataque# + random.randint(0, 5)

   def defender(self) -> int:
       return self._defesa #+ random.randint(1, 11)

class MulherMaravilha(Lutador):
   def __init__(self):
       # Chama o construtor da classe base com os valores específicos => Vida alta, Dano alto
       super().__init__("Mulher-Maravilha", 40, 50, 79)

   # Base + Fator de Sorte
   def ataque(self) -> int:
       return self._ataque #+ random.randint(1, 10)

   def defender(self) -> int:
       return self._defesa #+ random.randint(5, 15)


class HomemFerro(Lutador):
   def __init__(self):
       # Chama o construtor da classe base com os valores específicos => Vida alta, Dano alto
       super().__init__("Homem de Ferro", 50, 50, 60)

   # Base + Fator de Sorte
   def ataque(self) -> int:
       return self._ataque #+ random.randint(-10, 20)

   def defender(self) -> int:
       return self._defesa #+ random.randint(-5, 14)

# -- INTRODUÇÃO Programa principal --
def intro():
   print("*****************************************")
   print("       🥊 Luta de Super-Herois 🥊        ")
   print("*****************************************")

def sair():
   print("**** Programa encerrado ****\n")

def erro():
   print("Opcão inválida")

def ecran_inicio(superheroi_disponivel):
   quantidade_superheroi = len(superheroi_disponivel)
   print(f"\nQue super herois gostaria de ver lutar? (Selectionar de [1 - {quantidade_superheroi+1}] ")
   i=1
   for heroi in superheroi_disponivel:
       print(f"[{i}] {heroi}")
       i+=1
   print(f"[{quantidade_superheroi+1}] Sair")

def selecionar_heroi(superHeroi_disponivel, escolha: int):
   if 0 < escolha <= len(superHeroi_disponivel) :
       MeuHeroi = superHeroi_disponivel[escolha-1]
       return MeuHeroi()  # Cria e retorna a nova instância
   else:
       return None

def selecionar_heroi(lista_classes, escolha: int):
   # Assume que lista_classes contém as classes dos heróis
   if 0 < escolha <= len(lista_classes):
       # MeuHeroi agora contém a CLASSE (Ex: <class 'SuperMan'>)
       MeuHeroi = lista_classes[escolha - 1]

       # Chamamos a CLASSE para criar e retornar uma nova INSTÂNCIA (Ex: SuperMan())
       return MeuHeroi()
   else:
       return None

def remove_heroi_escolhido(total, escolha):
   return [i for i in range(1, total + 1) if i != escolha]

def selecionar_heroi_adversario(superHeroi_disponivel, numeroHerois, escolha):
   # Retira o Index do Heroi escolhido
   index_herois_restantes = remove_heroi_escolhido(numeroHerois, escolha)

   # Adicionando try-except para o random.choice no caso de lista vazia
   try:
       # Escolhemos um índice aleatório para o adversário, a partir dos index restantes
       escolha_adversario_index = random.choice(index_herois_restantes)
   except IndexError:
       return None  # Retorna None se não houver heróis restantes

   # Escolha aleatória após retirar o heroi escolhido
   return selecionar_heroi(superHeroi_disponivel, escolha_adversario_index)

def menuopcao(meu_heroi, heroi_adversario):
    continuar = "sim"

    while continuar!="terminou" and (meu_heroi.obter_vida() > 0 and heroi_adversario.obter_vida() > 0):
       print("\n** O que fazer? **")
       print("1) Combate")
       print("2) Detalhes do meu heroi")
       print("3) Conhecer o adversario")
       print("4) Sair")
       try:
           menuopcao = int(input("Escolha de [1-4]: "))
       except ValueError:
           erro()
           continue

       if menuopcao == 1:
           continuar = combate(meu_heroi, heroi_adversario)

       elif menuopcao == 2:
           print(f"Meu Heroi: {meu_heroi.get_nome()}, Ataque:  {meu_heroi.ataque()}, Defesa: {meu_heroi.defender()}, Vida: {meu_heroi.obter_vida()}.")

       elif menuopcao == 3:
           print(f"Herói Adversário: {heroi_adversario.get_nome()}, Ataque: <vais descobrir>, Defesa: {heroi_adversario.defender()}, Vida: <desconhecido> ")

       # Sair
       elif menuopcao == 4:
           sair()
           return

       # Erro
       else:
           erro()

def trocar_personagem(meu_heroi, heroi_adversario):
    if meu_heroi.obter_vida() > 0 and heroi_adversario.obter_vida() > 0:
       print(f"\nO seu personagem nesta ronda é {meu_heroi.get_nome()}, Ataque: {meu_heroi.ataque()}")
       print(f"E o personagem adversario é {heroi_adversario.get_nome()}, Ataque: {heroi_adversario.ataque()}")
       trocar = str(input("=> Pertende manter a proxima jogada com o seu heroi? [S/N]:"))
       if trocar == "N":
           return 0
       else:
           return 1

#3. Permita ao utilizador escolher dois personagens para uma luta. Os utilizadores podem alternar
# entre os personagens e escolher ações de ataque e defesa para cada rodada.
def combate(meu_heroi, heroi_adversario):
   # Establecer critérios de rodadas por combate
   rodada = 1
   max_rodada = 8

   # Permite escolher qual o heroi que começa
   # 0 => Jogador | 1 = Adversário
   actual_jogador = 1

   if meu_heroi.obter_vida() > 0 and heroi_adversario.obter_vida() > 0 :
       trocar = trocar_personagem(meu_heroi, heroi_adversario)
       if actual_jogador == trocar:
           heroi_ativo = meu_heroi
           heroi_passivo = heroi_adversario
       else:
           heroi_ativo = heroi_adversario
           heroi_passivo = meu_heroi
   else:
       print("Partida terminada.")

   #5. Exiba informações sobre o resultado de cada rodada de combate, incluindo a quantidade de vida restante de cada personagem.
   while rodada <= max_rodada and (heroi_ativo.obter_vida() > 0 and heroi_passivo.obter_vida() > 0):
       print(f"\n{30*'-'}")
       print(f"{5*'-'}     Rodada: {rodada}     {5*'-'}")
       print(f"{30*'-'}")
       print(f"\nO combate é entre {heroi_ativo.get_nome()} (heroi escolhido) VS {heroi_passivo.get_nome()} (heroi aleatório)")
       print("1) Atacar")
       print("2) Defender")
       print("3) Obter estado de vida")
       print("4) Sair")
       try:
           jogada = int(input("O que pertende fazer? [1-4]:"))
           if rodada == 0:
               return "terminou"
       except ValueError:
           erro()
           continue
       print("\n")

       if jogada == 1:
           print(f"O {heroi_ativo.get_nome()} ataca com possibilidade de dano: {heroi_ativo.ataque()}.")
           print(f"O {heroi_passivo.get_nome()} defende com {heroi_passivo.defender()} pontos.\n")
           dano = abs(heroi_ativo.ataque() - heroi_passivo.defender())
           if dano > 0:
               heroi_passivo.receber_dano(abs(heroi_ativo.ataque()))
               print(f"{heroi_passivo.get_nome()} sofreu {heroi_ativo.ataque()} de dano e agora tem {heroi_passivo.obter_vida()} de vida.")
           else:
               print(f"{heroi_passivo.get_nome()} defendeu o ataque com sucesso! Vida atual: {heroi_passivo.obter_vida()}.")

           if (heroi_ativo.obter_vida() > 0 and heroi_passivo.obter_vida() > 0):

               rodada_em_falta = max_rodada - rodada
               print(f"\n{30 * '-'}")
               print(f"Faltam {rodada_em_falta} / {max_rodada} rodadas")
               rodada += 1

               if rodada == 0:
                   print("Partida terminada.")
                   return "terminou"

               trocar = trocar_personagem(heroi_ativo, heroi_adversario)

               if actual_jogador == trocar:
                   heroi_ativo = heroi_ativo
                   heroi_passivo = heroi_adversario
               else:
                   heroi_transicao = heroi_ativo
                   heroi_ativo = heroi_adversario
                   heroi_passivo = heroi_transicao

           else:
               print("Partida terminada.")
               return "terminou"

       if jogada == 2:
           print(f"O {heroi_ativo.get_nome()} tem {heroi_ativo.defender()} de defesa.")
           dano = abs(heroi_ativo.defender() - heroi_passivo.ataque())
           if dano < 0:
               heroi_ativo.receber_dano(abs(heroi_passivo.ataque()))
               print(f"{heroi_ativo.get_nome()} sofreu {dano} de dano e agora tem {heroi_ativo.obter_vida()} de vida.")
           else:
               print(f"{heroi_ativo.get_nome()} defendeu com sucesso! Vida atual: {heroi_ativo.obter_vida()}.")

           if (heroi_ativo.obter_vida() > 0 and heroi_passivo.obter_vida() > 0):
               rodada_em_falta = max_rodada - rodada
               print(f"\n{30 * '-'}")
               print(f"Faltam {rodada_em_falta} / {max_rodada} rodadas")
               rodada += 1

               trocar = trocar_personagem(heroi_ativo, heroi_adversario)
               if actual_jogador == trocar:
                   heroi_ativo = heroi_ativo
                   heroi_passivo = heroi_adversario
               else:
                   heroi_transicao = heroi_ativo
                   heroi_ativo = heroi_adversario
                   heroi_passivo = heroi_transicao

           else:
               print("Partida terminada.")
               return "terminou"

       if jogada == 3:
           print(f"O {heroi_ativo.get_nome()} tem {heroi_ativo.obter_vida()} pontos de vida. E o {heroi_passivo.get_nome()}, tem {heroi_passivo.obter_vida()} de vida.")

           trocar = trocar_personagem(meu_heroi, heroi_adversario)
           if actual_jogador == trocar:
               heroi_ativo = meu_heroi
               heroi_passivo = heroi_adversario
           else:
               heroi_ativo = heroi_adversario
               heroi_passivo = meu_heroi

       if jogada == 4:
           sair()
           return "terminou"

# -- PROGRAMA PRINCIPAL
def main():
   intro()
   superHeroi_disponivel = ["Aleatório","SuperMan","Capitão América","Mulher-Maravilha","Homem de Ferro"]
   superHeroi_disponivel_class=[Aleatorio,SuperMan,CapitaoAmerica,MulherMaravilha,HomemFerro]
   numeroHerois = len(superHeroi_disponivel)

   while True:
       ecran_inicio(superHeroi_disponivel)
       try:
           escolha = int(input("Escolha: "))
       except ValueError:
           erro()  # Chama a função que imprime "Opção inválida"
           continue  # Volta ao início do loop 'while True', caso utilisador escreva valor errado
           
       print("________________________________\n")

       if escolha in range(1, numeroHerois):
           MeuHeroi = selecionar_heroi(superHeroi_disponivel_class, escolha)
           print("O meu Meu Heroi escolhido é: ", MeuHeroi.get_nome())

           # Selecionamos o Adversário usando o índice aleatório, com base nos herois restantes
           HeroiAdversario = selecionar_heroi_adversario(superHeroi_disponivel_class, numeroHerois, escolha)
           print("O Heroi Adversario aleatório é:", HeroiAdversario.get_nome())

           menuopcao(MeuHeroi, HeroiAdversario)

       # Sair
       elif escolha == (numeroHerois + 1): # O '6' aqui é calculado corretamente como 5 + 1:
           sair()
           break

       # Erro
       else:
           erro()
main()