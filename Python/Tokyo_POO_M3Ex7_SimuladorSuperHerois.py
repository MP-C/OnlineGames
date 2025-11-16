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
    rodada = 1
    max_rodadas = 8  # Definindo um limite para o combate

    while meu_heroi.obter_vida() > 0 and heroi_adversario.obter_vida() > 0 and rodada <= max_rodadas:
        print(f"\n======== ⚔️ RONDA {rodada} / {max_rodadas} ⚔️ ========")
        print("\n** QUEM ATACA NESTA RONDA? **")
        print(f"1) {meu_heroi.get_nome()} (Vida: {meu_heroi.obter_vida()})")
        print(f"2) {heroi_adversario.get_nome()} (Vida: {heroi_adversario.obter_vida()})")
        print("3) Detalhes e Sair")

        try:
            escolha_atacante = int(input("Escolha de [1-3]: "))
        except ValueError:
            erro()
            continue

        if escolha_atacante == 1:
            heroi_ativo = meu_heroi
            heroi_passivo = heroi_adversario
            combate_unica_jogada(heroi_ativo, heroi_passivo, True)
            rodada += 1

        elif escolha_atacante == 2:
            heroi_ativo = heroi_adversario
            heroi_passivo = meu_heroi
            combate_unica_jogada(heroi_ativo, heroi_passivo, False)
            rodada += 1

        elif escolha_atacante == 3:
            print(f"Meu Heroi: {meu_heroi.get_nome()}, Vida: {meu_heroi.obter_vida()}.")
            print(f"Adversário: {heroi_adversario.get_nome()}, Vida: {heroi_adversario.obter_vida()}.")
            sair()
            return

        else:
            erro()

    print("\n==================================================================")
    if rodada > max_rodadas:
        print("⏰ FIM DO TEMPO! O combate terminou por limite de rondas.")

    # Exibir o resultado final
    if meu_heroi.obter_vida() > heroi_adversario.obter_vida():
        print(f"🎉 O vencedor é {meu_heroi.get_nome()}! (Vida: {meu_heroi.obter_vida()})")
    elif heroi_adversario.obter_vida() > meu_heroi.obter_vida():
        print(f"😔 O vencedor é {heroi_adversario.get_nome()}. (Vida: {heroi_adversario.obter_vida()})")
    else:
        print("🤝 EMPATE! Ambos caíram ou têm vida igual.")
    print("\n==================================================================")

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
def combate_unica_jogada(heroi_ativo, heroi_passivo, is_player_hero):
    """Executa a lógica de ataque/defesa para um único herói numa rodada."""

    if is_player_hero:
        print(f"\nO que {heroi_ativo.get_nome()} vai fazer?")
        print("1) Atacar (tenta vencer a defesa do alvo)")
        print("2) Defender (tenta reduzir o ataque do alvo)")

        try:
            jogada = int(input("O que pertende fazer? [1-2]:"))
        except ValueError:
            erro()
            return

        if jogada == 1:
            # Lógica de ataque: Ativo ataca Passivo
            dano_bruto = heroi_ativo.ataque()
            defesa_alvo = heroi_passivo.defender()
            dano_final = max(0, dano_bruto - defesa_alvo)
            heroi_passivo.receber_dano(dano_final)

            print(
                f"💥 {heroi_ativo.get_nome()} ATACA! (Ataque: {dano_bruto}) vs Defesa de {heroi_passivo.get_nome()} ({defesa_alvo}).")
            print(
                f"💔 Dano causado: {dano_final}. Vida restante de {heroi_passivo.get_nome()}: {heroi_passivo.obter_vida()}.")

        elif jogada == 2:
            # Lógica de defesa: Ativo defende-se de um ataque do Passivo
            ataque_passivo = heroi_passivo.ataque()  # Simula um contra-ataque do passivo
            defesa_ativa = heroi_ativo.defender()
            dano_sofrido = max(0, ataque_passivo - defesa_ativa)
            heroi_ativo.receber_dano(dano_sofrido)

            print(
                f"🛡️ {heroi_ativo.get_nome()} DEFENDE! (Defesa: {defesa_ativa}) vs Ataque de {heroi_passivo.get_nome()} ({ataque_passivo}).")
            print(
                f"🩹 Dano sofrido: {dano_sofrido}. Vida restante de {heroi_ativo.get_nome()}: {heroi_ativo.obter_vida()}.")
        else:
            erro()

    else:
        # Lógica para o adversário (Simplificada: ataca por defeito)
        print(f"\n{heroi_ativo.get_nome()} (Adversário) ataca automaticamente.")
        dano_bruto = heroi_ativo.ataque()
        defesa_alvo = heroi_passivo.defender()
        dano_final = max(0, dano_bruto - defesa_alvo)
        heroi_passivo.receber_dano(dano_final)

        print(
            f"💥 {heroi_ativo.get_nome()} ATACA! (Ataque: {dano_bruto}) vs Defesa de {heroi_passivo.get_nome()} ({defesa_alvo}).")
        print(
            f"💔 Dano causado: {dano_final}. Vida restante de {heroi_passivo.get_nome()}: {heroi_passivo.obter_vida()}.")

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