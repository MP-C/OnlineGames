import java.util.ArrayList;
import java.util.List;

/**
 * Esta classe demonstra os cinco princípios SOLID (Single Responsibility,
 * Open/Closed, Liskov Substitution, Interface Segregation, Dependency Inversion),
 * que são diretrizes cruciais para o design de software orientado a objetos.
 */
public class SOLID {

    // =================================================================
    // S - Single Responsibility Principle (SRP)
    // Uma classe deve ter apenas uma razão para mudar.
    // =================================================================
    public static class SingleResponsibility {

        // CLASSE 1: Responsabilidade única: Gerenciar dados da forma (Entidade)
        public static class Square {
            private float length;

            public Square(float length) {
                this.length = length;
            }

            public float getLength() {
                return length;
            }
        }

        // CLASSE 2: Responsabilidade única: Calcular a área da forma (Cálculo)
        public static class AreaCalculator {

            public double calculateSquareArea(Square square) {
                return square.getLength() * square.getLength();
            }

            // Se quisermos calcular a área de um círculo (mantendo o SRP,
            // este método lida apenas com a lógica de cálculo, e não com a exibição).
            public double calculateCircleArea(Circle circle) {
                return Math.PI * circle.getRadius() * circle.getRadius();
            }
        }

        // CLASSE 3: Responsabilidade única: Exibir o resultado (Apresentação/Relatório)
        public static class AreaPresenter {
            public static void printArea(String shapeName, double area) {
                System.out.println("A área do(a) " + shapeName + " é: " + area);
            }
        }
    }

    // =================================================================
    // O - Open-Closed Principle (OCP)
    // Aberto para extensão, fechado para modificação.
    // =================================================================
    public static class OpenClosed {

        // INTERFACE: Define o contrato. Adicionar novas formas não exige mudar Shape.
        public interface Shape {
            double calculateArea();
        }

        // CLASSE: Quadrado (Aberto para extensão, implementando Shape)
        public static class SquareClass implements Shape {
            private float length;

            public SquareClass(float length) {
                this.length = length;
            }

            @Override
            public double calculateArea() {
                return Math.pow(this.length, 2);
            }
        }

        // CLASSE: Círculo (Aberto para extensão, implementando Shape)
        public static class CircleClass implements Shape {
            private float radius;

            public CircleClass(float radius) {
                this.radius = radius;
            }

            @Override
            public double calculateArea() {
                return Math.PI * Math.pow(this.radius, 2);
            }
        }

        // CLASSE: AreaCalculator (Fechado para modificação. Se uma nova forma for adicionada,
        // esta classe não precisa ser alterada, pois depende da abstração Shape).
        public static class AreaAggregator {

            // A classe depende da abstração (Shape), e não das implementações (SquareClass, CircleClass).
            public double sumAreas(List<Shape> shapes) {
                double totalArea = 0.0;
                for (Shape shape : shapes) {
                    // O polimorfismo garante que o método correto seja chamado.
                    totalArea += shape.calculateArea();
                }
                return totalArea;
            }
        }
    }

    // =================================================================
    // L - Liskov Substitution Principle (LSP)
    // Subclasses devem ser substituíveis por suas superclasses sem alterar
    // a correção do programa.
    // =================================================================
    public static class LiskovSubstitution {

        // CLASSE ABSTRATA: Define um comportamento básico (o que todos podem fazer).
        public abstract static class Bird {
            public abstract void eat();
        }

        // INTERFACE: Define um comportamento específico para aqueles que podem voar.
        public interface IFlyable {
            void fly();
        }

        // CLASSE CORRETA: O Pardal pode ser substituído por Bird (Eat) e por IFlyable (Fly)
        public static class Sparrow extends Bird implements IFlyable {
            @Override
            public void eat() {
                System.out.println("Pardal: Eu como sementes.");
            }

            @Override
            public void fly() {
                System.out.println("Pardal: Eu sei voar muito bem.");
            }
        }

        // CLASSE CORRETA: A Galinha pode ser substituída por Bird (Eat), mas não por IFlyable,
        // evitando a herança de um método inútil (como 'fly()' que lança exceção).
        public static class Chicken extends Bird {
            @Override
            public void eat() {
                System.out.println("Galinha: Eu sei comer, mas não sei voar.");
            }
        }

        // Método que aceita apenas aves voadoras
        public static void forceFlying(IFlyable bird) {
            bird.fly();
        }
    }

    // =================================================================
    // I - Interface Segregation Principle (ISP)
    // Clientes não devem ser forçados a depender de interfaces que não usam.
    // É melhor ter muitas interfaces pequenas do que uma gigante.
    // =================================================================
    public static class InterfaceSegregation {

        // INTERFACE PEQUENA 1: Responsável apenas por cálculos de área (2D)
        public interface Shape2D {
            double calculateArea();
        }

        // INTERFACE PEQUENA 2: Responsável apenas por cálculos de volume (3D)
        public interface Shape3D {
            double calculateVolume();
        }

        // CLASSE: Cuboid (Implementa ambos, pois precisa de ambos os cálculos)
        public static class Cuboid implements Shape2D, Shape3D {
            private double length, width, height;

            public Cuboid(double l, double w, double h) {
                this.length = l;
                this.width = w;
                this.height = h;
            }

            @Override
            public double calculateArea() {
                // Cálculo da área de superfície do cuboide
                return 2 * (length * width + length * height + width * height);
            }

            @Override
            public double calculateVolume() {
                return length * width * height;
            }
        }

        // CLASSE: Circle (Implementa apenas Shape2D, sem ser forçado a ter calculateVolume)
        public static class Circle implements Shape2D {
            private double radius;

            public Circle(double r) {
                this.radius = r;
            }

            @Override
            public double calculateArea() {
                return Math.PI * Math.pow(radius, 2);
            }

            // Não é forçado a implementar calculateVolume()
        }
    }

    // =================================================================
    // D - Dependency Inversion Principle (DIP)
    // Módulos de alto nível não devem depender de módulos de baixo nível.
    // Ambos devem depender de abstrações (Interfaces).
    // =================================================================
    public static class DependencyInversion {

        // ABSTRAÇÃO: Interface de alto nível (o Contrato)
        public interface DBConnectionInterface {
            String connect();
        }

        // MÓDULO DE BAIXO NÍVEL (Implementação): Depende da Abstração.
        public static class MySQLConnection implements DBConnectionInterface {
            @Override
            public String connect() {
                return "Conexão MySQL estabelecida.";
            }
        }

        // MÓDULO DE BAIXO NÍVEL (Nova Implementação): Fácil de substituir.
        public static class PostgreSQLConnection implements DBConnectionInterface {
            @Override
            public String connect() {
                return "Conexão PostgreSQL estabelecida.";
            }
        }

        // MÓDULO DE ALTO NÍVEL: Depende da Abstração (DBConnectionInterface), e não
        // de uma implementação concreta (como MySQLConnection).
        public static class PasswordReminder {
            private final DBConnectionInterface dbConnection;

            // Injeção de Dependência via Construtor
            public PasswordReminder(DBConnectionInterface dbConnection) {
                this.dbConnection = dbConnection;
            }

            public void sendReminder() {
                String status = dbConnection.connect();
                System.out.println("Lembrete de senha enviado. Status da Conexão: " + status);
            }
        }
    }

    // =================================================================
    // MÉTODO MAIN PARA DEMONSTRAÇÃO
    // =================================================================
    public static void main(String[] args) {

        System.out.println("=========================================");
        System.out.println("        DEMONSTRAÇÃO DOS PRINCÍPIOS SOLID");
        System.out.println("=========================================");

        // --- S - Single Responsibility ---
        System.out.println("\n--- S (SRP) - Responsabilidade Única ---");
        SingleResponsibility.Square s = new SingleResponsibility.Square(5.0f);
        SingleResponsibility.AreaCalculator calculator = new SingleResponsibility.AreaCalculator();
        double area = calculator.calculateSquareArea(s);
        SingleResponsibility.AreaPresenter.printArea("Quadrado (5x5)", area);

        // --- O - Open/Closed ---
        System.out.println("\n--- O (OCP) - Aberto/Fechado ---");
        OpenClosed.SquareClass sq = new OpenClosed.SquareClass(4.0f);
        OpenClosed.CircleClass ci = new OpenClosed.CircleClass(3.0f);
        List<OpenClosed.Shape> shapes = new ArrayList<>();
        shapes.add(sq);
        shapes.add(ci);

        OpenClosed.AreaAggregator aggregator = new OpenClosed.AreaAggregator();
        double total = aggregator.sumAreas(shapes);
        System.out.println("Área Total (Quad. 4x4 + Cír. R=3): " + total);

        // --- L - Liskov Substitution ---
        System.out.println("\n--- L (LSP) - Substituição de Liskov ---");
        LiskovSubstitution.Sparrow sparrow = new LiskovSubstitution.Sparrow();
        LiskovSubstitution.Chicken chicken = new LiskovSubstitution.Chicken();

        // Ambas as classes substituem o tipo Bird:
        sparrow.eat();
        chicken.eat();

        // Apenas o Sparrow pode ser usado onde IFlyable é esperado:
        LiskovSubstitution.forceFlying(sparrow);
        // LiskovSubstitution.forceFlying(chicken); // Isso geraria um erro de compilação (CORRETO!)

        // --- I - Interface Segregation ---
        System.out.println("\n--- I (ISP) - Segregação de Interfaces ---");
        InterfaceSegregation.Cuboid cuboid = new InterfaceSegregation.Cuboid(2, 3, 4);
        InterfaceSegregation.Circle circle2D = new InterfaceSegregation.Circle(5);

        // Cuboid usa ambas as interfaces
        System.out.println("Volume do Cuboide (3D): " + cuboid.calculateVolume());
        // Circle usa apenas a 2D
        System.out.println("Área do Círculo (2D): " + circle2D.calculateArea());

        // --- D - Dependency Inversion ---
        System.out.println("\n--- D (DIP) - Inversão de Dependência ---");

        // Alto nível depende da Abstração (DBConnectionInterface)
        DependencyInversion.DBConnectionInterface mySql = new DependencyInversion.MySQLConnection();
        DependencyInversion.PasswordReminder reminder1 = new DependencyInversion.PasswordReminder(mySql);
        reminder1.sendReminder(); // Conexão MySQL

        // Facilidade de mudar a dependência sem alterar a classe PasswordReminder (alto nível)
        DependencyInversion.DBConnectionInterface postgreSql = new DependencyInversion.PostgreSQLConnection();
        DependencyInversion.PasswordReminder reminder2 = new DependencyInversion.PasswordReminder(postgreSql);
        reminder2.sendReminder(); // Conexão PostgreSQL
    }
}
