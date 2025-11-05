public class SOLID {
    /*
    SOLID é uma sigla para os primeiros cinco princípios do design orientado a objeto (OOD)
    Estabelecem práticas que contribuem para o desenvolvimento de software com considerações de manutenção e
    extensão à medida que o projeto cresce. A adoção dessas práticas também pode contribuir para evitar problemas
    de código, refatoração de código e o desenvolvimento ágil e adaptativo de software.
    */

    //S - Single-Responsability (Princípio da responsabilidade única) => cada class tem a sua responsabilidade:
    // 1 class para formas, 1a para calculos, 1a para apresentar dados
    public class Single{
        public class Square{
            public float length;
            public Square (float length){
                this.length = length;
            }
        }
        public class Circle{
            public float radius;
            public Circle (float radius){
                this.radius = radius;
            }
        }
        public class AreaCalculator{
            protected String shapes;
            public AreaCalculator(shapes){
                this.shapes = shapes;
            }
            public static void sum(){
                float area;
                if(shape= square ){

                } else if (shape = circle) {

                }
                return area;
            }
        }
    }

    //O - Open-closed Principle (Princípio do aberto-fechado)
    // Class ou Entities Aberto para extensão e fechado para modificação
    // Querendo acrescentar mais funcionalidades, ao criar nova classe que herda Formas, permite que cada Class tenha
    // o seu proprio calculo, Aqui, o metodo sum é removido da Class AreaCalculator, e associadao à class de cada forma
    // Desta forma a minha Order pode receber qualquer tipo de desconto, desde que essa classe herde a estratégia
    // Isto também é composition por herança
    public class Openclosed {
        // Interface que define o comportamento básico que todas as formas devem ter: calcular a área.
        interface Shape {
            double calculateArea();
        }

        // Classe que gere a forma Quadrado.
        public class SquareClass implements Shape {
            // Variável privada para armazenar o comprimento do lado.
            private float length;

            // Construtor para implementar o objecto quando instanciado
            public SquareClass(float initialLength) {
                this.length = initialLength;
            }

            // Método Getter: Retorna o comprimento atual do lado do quadrado.
            public float getLength() {
                return length;
            }

            // Método Setter: Permite alterar o comprimento do lado.
            public void setLength(float newLength) {
                this.length = newLength;
            }

            // Implementação do método calculateArea da interface Shape.
            @Override
            public double calculateArea() {
                return Math.pow(this.length, 2);
            }
        }

        // Classe que gere a forma Círculo.
        class CircleClass implements Shape {
            private float radius;

            public CircleClass(float initialRadius) {
                this.radius = initialRadius;
            }

            // Implementação do método calculateArea da interface Shape.
            @Override
            public double calculateArea() {
                return Math.PI * Math.pow(this.radius, 2);
            }
        }

        class AreaCalculator {
            // A coleção agora é uma lista de objetos que implementam a interface Shape.
            private Shape[] shapes;

            // Construtor em Java que recebe um array de Shapes.
            public AreaCalculator(Shape[] shapes) {
                this.shapes = shapes;
            }

            // Função para somar as áreas de todas as formas.
            public double sum() {
                double totalArea = 0.0;
                // Loop for-each em Java
                for (Shape shape : this.shapes) {
                    // Chamamos o método calculateArea, independentemente de ser Square ou Circle.
                    totalArea += shape.calculateArea();
                }
                return totalArea;
            }
        }

        // Classe para demonstração (main method)
        class GeometryDemo {
            public void main(String[] args) {
                // Criar instâncias das formas
                SquareClass s1 = new SquareClass(10.0f);
                CircleClass c1 = new CircleClass(5.5f);

                // Criar um array de Shapes
                Shape[] minhasFormas = {s1, c1};

                // Criar o calculador com as formas
                AreaCalculator calculator = new AreaCalculator(minhasFormas);

                // Calcular e imprimir a soma
                double totalArea = calculator.sum();
                System.out.println("Área Total Combinada: " + totalArea);
            }
        }
    }

    //L - Liskov Substitution Principle (Princípio da substituição de Liskov)
    // Nunca criar heranças de uma super classe se a subclasse nunca vai implementar alguns destes métodos
    // Mais vale separar cada uma delas e as suas funcionalidades, e só chamar quando cada uma é necessária
    class Liskov{
        public abstract class Bird // Esta class faz uma coisa e unica
        {
            public abstract void Eat(); // Comportamento que todos devem ter
        }

        public interface IFlyable // esta class faz uma coisa e unica, ainda que pudesse estar em Bird
        {
            void Fly();
        }

        public class Passaro extends Bird implements IFlyable {
            @Override
            public void Eat() {
                System.out.println("Eu sei COMER");
            }

            @Override
            public void Fly() {
                System.out.println("Eu sei voar");
            }

            public class Galinha extends Bird {
                @Override
                public void Eat() {
                    System.out.println("Eu sei comer, mas não sei voar");
                }
            }
        }
    }

    //I - Interface Segregation Principle (Princípio da segregação de interfaces)
    // Mais velem várias interfaces pequenas e específicas a uma interface gigante
    // Assim as classes não implementam métodos que não usam
    class Interface {
        interface ShapeInterface {
            public class area {
            }
        }

        interface ThreeDimensionalShapeInterface {
            public class volume {
            }
        }

        class Cuboid implements ShapeInterface, ThreeDimensionalShapeInterface {
            public class area {
                // calculate the surface area of the cuboid
            }
            public class volume {
                // calculate the volume of the cuboid
            }
        }
    }

    //D - Dependency Inversion Principle (Princípio da inversão de dependência)
    // Alto nivel não deve depender de baixo nível
    // As entidades devem dependender de abstrações e não de de implementações.
    class Dependency{

        // ANTES;
        class MySQLConnection //conecta-se à base de dados
        {
            public String connect()
            {
                // handle the database connection
                return 'Database connection';
            }
        }
        class PasswordReminder // usa a conexão que MySQLConnection executa
        {
            private dbConnection(){};

            public void construct(MySQLConnection dbConnection)
            {
                this.dbConnection = dbConnection;
            }
        }
        // Sempre que há uma base nova, a connexão de MySQLConnection tem de ser novamente construida (desrespeita 2 principios

        // DEPOIS
        // AO se criar uma nova interface
        interface DBConnectionInterface
        {
            public class connect{};
        }

        // A conexão é establecida pela interface
        class MySQLConnection implements DBConnectionInterface
        {
            @override
            public String connect()
            {
                // handle the database connection
                return 'Database connection';
            }
        }

        // e a conexão continua a ser a mesma, sem se ter de mexer na MySQLConnection
        class PasswordReminder
        {
            private dbConnection(){};

            public void construct(DBConnectionInterface dbConnection)
            {
                this.dbConnection = dbConnection;
            }
        }
    }
}
