import java.util.ArrayList;

public class POO {
    static class Polimorfismo{ // Multiforma => permite que o mesmo método opera de forma diferente em classes diferentes
        // e que objetos de diferentes classes possam ter tratados pela mesma interface (Mais flexivel)
        public abstract static class Animal{

            public static ArrayList<Animal> list = new ArrayList<>();

            // Protected => a class filha pode aceder ao metodo da supra class, e tem de o fazer para poder alterar aos seus valores na filha
            // Private => permite que a class possa alterar os seus atributos dentro dela propria
            private String nome;

            // Public => Todas as propriedades são acessiveis fora do método
            public Animal(String nome){
               this.nome= nome;
               list.add(this);
            }

            // Construtor => para que se possa implementar a class
            public Animal(){
                this.nome= "nome";
                list.add(this);
            }

            // ENCAPSULAMENTO => Mecanismo que permite agrupar dados e métodos que operam esses dados, numa unica unidade
            //restringindo o acesso a partir do exterior: Private, (Protected), Public
            public void setNome(String nome) {
                this.nome = nome;
            }
            public String getNome() {
                return nome;
            }

            // ABSTRAÇÃO => Focar na essencia do objeto e ocultar detalhes complexos da implementação (menos complexo)
            public void Comer(){
                System.out.println("como qualquer coisa");
            }
            public abstract void Cumprimentar();
            public static void Cumprimentar(String som){
                System.out.println("Eu sou o animal e faço: " + som + "!");
            }
        }

        // HERANÇA => Uma subclass filha que herda as propriedades de uma supraclass (Reutiliza código)
        public static class Pessoa extends Animal{
            @Override
            public void Cumprimentar(){
                System.out.println("Eu sou humano");
            }
        }

        // INTERFACE => Ações
        // Tudo o que for "voavel" tem de voar
        public static interface IVoavel{
            public void voar();

            void Cumprimentar();
        }

        // CLASS => Atributos
        public static class Galinha extends Animal implements IVoavel{
            @Override
            public void Cumprimentar(){
                System.out.println("Eu sou humano");
            }

            @Override
            public void voar() {
                System.out.println("Eu voo pouco");
            }
        }
    }


    public static void main(String[] args){

        /** POLIMORFISMO */
        //Overriding => Implemntação de um método que já existe e é alterado para esta class (RUN TIME)
        POO.Polimorfismo.Animal.Cumprimentar("Olá");
        POO.Polimorfismo.Animal.Cumprimentar("Miau");

        // Overload => mesmo metodo opera resultados diferentes (COMPILE TIME)
        Polimorfismo.Pessoa p1=new Polimorfismo.Pessoa();
        Polimorfismo.Pessoa p2=new Polimorfismo.Pessoa();
        p1.Cumprimentar();
        p2.Cumprimentar();

        // Interface => contrato que obriga a class a fazer uma determinada acção. Interface permite aplicar também a noção de abstração
        Polimorfismo.IVoavel ave = new Polimorfismo.Galinha();
        ave.voar();
        ave.Cumprimentar();
    }
}
