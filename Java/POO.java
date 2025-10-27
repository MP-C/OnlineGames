import java.util.ArrayList;
import java.util.List;

// =================================================================
// 1. ABSTRAÇÃO (Interface): Define um contrato
// =================================================================
interface Cumprivel {
    // Métodos em interfaces são implicitamente public e abstract
    void acaoEspecial();
}

// =================================================================
// 2. ABSTRAÇÃO e HERANÇA (Classe Abstrata)
// =================================================================
abstract class Animal implements Cumprivel {
    
    // Lista estática para rastrear TODAS as instâncias (memória compartilhada - O(1) de acesso)
    // O uso de 'static' corrige o erro do código original onde cada instância tinha sua própria lista.
    public static final List<Animal> listaAnimais = new ArrayList<>();
    
    // Campo de instância (Encapsulamento - deve ser acessado via Getter/Setter)
    protected String nome;

    // Construtor
    public Animal(String nome) {
        this.nome = nome;
        Animal.listaAnimais.add(this); // Adiciona a instância atual à lista compartilhada
    }

    // Métodos Getters e Setters (ENCAPSULAMENTO)
    public void setNome(String nome) {
        this.nome = nome;
    }
    public String getNome() {
        return nome;
    }

    // Método Concreto (HERANÇA)
    public void comer() {
        System.out.println(this.nome + " está comendo algo genérico.");
    }

    // Método Abstrato (ABSTRAÇÃO) - Deve ser implementado pelas subclasses (Overriding)
    public abstract void fazerSom();

    // Método Estático (EXEMPLO DE OVERLOADING com o método 'fazerSom')
    // É chamado pela CLASSE, e não pelo objeto.
    public static void instrucaoGeral(String instrucao) {
        System.out.println("Instrução Geral (Estática): " + instrucao);
    }
}

// =================================================================
// 3. SUBCLASSE (Herança e Polimorfismo)
// =================================================================
class Cachorro extends Animal {
    
    // Construtor: Chama o construtor da superclasse
    public Cachorro(String nome) {
        super(nome);
    }

    // POLIMORFISMO (Overriding): Implementa o método abstrato 'fazerSom'
    @Override
    public void fazerSom() {
        System.out.println(this.nome + " diz: Au Au!");
    }

    // Implementação do método da Interface 'Cumprivel'
    @Override
    public void acaoEspecial() {
        System.out.println(this.nome + " (Cachorro) abana o rabo, cumprimentando.");
    }
    
    // POLIMORFISMO (Overloading): Sobrecarga do método 'fazerSom'
    public void fazerSom(int repeticoes) {
        System.out.print(this.nome + " Late " + repeticoes + " vezes: ");
        for (int i = 0; i < repeticoes; i++) {
            System.out.print("Woof! ");
        }
        System.out.println();
    }
}

// =================================================================
// 4. CLASSE PRINCIPAL DE DEMONSTRAÇÃO
// =================================================================
public class POODemo {
    public static void main(String[] args) {
        
        System.out.println("--- DEMONSTRAÇÃO DOS PILARES DA POO ---");
        
        // Criação das instâncias
        Cachorro rex = new Cachorro("Rex");
        Cachorro bela = new Cachorro("Bela");
        
        // 1. HERANÇA & POLIMORFISMO (Overriding)
        System.out.println("\n--- 1. POLIMORFISMO (Overriding) e HERANÇA ---");
        rex.fazerSom(); // Chama o método específico de Cachorro
        bela.comer();   // Chama o método herdado de Animal
        
        // 2. POLIMORFISMO (Overloading)
        System.out.println("\n--- 2. POLIMORFISMO (Overloading) ---");
        Animal.instrucaoGeral("Silêncio no recinto."); // Chama o método estático
        rex.fazerSom(4); // Chama o método sobrecarregado (com parâmetro)
        
        // 3. ABSTRAÇÃO & INTERFACE
        System.out.println("\n--- 3. ABSTRAÇÃO (Interface) ---");
        rex.acaoEspecial();
        
        // 4. ENCAPSULAMENTO
        System.out.println("\n--- 4. ENCAPSULAMENTO ---");
        System.out.println("Nome atual (usando Getter): " + bela.getNome());
        bela.setNome("Bella the Great"); // Uso do Setter
        System.out.println("Novo nome (usando Getter): " + bela.getNome());
        
        // 5. LISTA ESTÁTICA CORRIGIDA
        System.out.println("\n--- 5. ESTRUTURA ESTÁTICA ---");
        System.out.println("Total de animais criados (lista estática): " + Animal.listaAnimais.size());
        for (Animal a : Animal.listaAnimais) {
            System.out.println(" - " + a.getNome());
        }
    }
}