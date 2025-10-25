using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DesignPatterns.classes
{
    internal class DesignPatterns
    {
    }

    /*
     * Tipos de design patterns:
     * 
     * Creational - Controlar como os objetos são criados
     * 
     * Structural - Controlar como classes e objetos se organizam
     * 
     * Behavioral - Controlar como os objetos interagem e se comunicam
     *
     *
     */


    #region Singleton -> quando e como usar (Creational)
    // Garante que só existe uma instância global de uma classe
    // Ideal para configurações da aplicação (AppConfig), Logs (Logger) e gerir conexões DatabaseConnection
    public class Logger
    {
        private static Logger _instance = new Logger();

        private Logger() // Construtor privado, bloqueia instancia do lado de fora
        {

        }

        public static Logger Instance => _instance;

        public void Log(string message)
        {
            Console.WriteLine(message);
        }

    }

    #endregion

    #region Factory Method -> criação flexível (Creational)
    // Cria objetos sem expor a lógica de criação
    // Define uma interface ou método abstrato para criar objetos
    // Permite que subclasses decidam qual classe concreta instanciar
    // Ajuda a seguir OCP e DIP, oprque o código cliente não depende de classes concretas
    // Decide qual método criar

    public interface IButton
    {
        void Render();
    }

    public class WindowsButton : IButton
    {
        public void Render() => Console.WriteLine("Render Windows Button");
    }

    public class MacButton : IButton
    {
        public void Render() => Console.WriteLine("Render MacButton");
    }

    public abstract class Dialog
    {
        public abstract IButton CreateButton();  // Factory Method

        public void RenderButton()
        {
            var button = CreateButton();
            button.Render();
        }
    }


    // Dialogs concretas
    public class WindowsDialog : Dialog
    {
        public override IButton CreateButton() => new WindowsButton();
    }

    public class MacDialog : Dialog
    {
        public override IButton CreateButton() => new MacButton();
    }

    public class testingDialog
    {
        public void Testing()
        {
            Dialog dialog;

            string os = "Windows"; // pode vir de configuração
            if (os == "Windows")
                dialog = new WindowsDialog();
            else
                dialog = new MacDialog();

            dialog.RenderButton();
        }
    }
    #endregion

    #region Strategy -> substituiu if/else e melhora ocp (Behavioral)
    // Define famílias de algoritmos e escolhe um em tempo de execução
    // Decude como método de comporta
    // Interface da estratégia
    public interface IShippingStrategy
    {
        decimal Calculate(decimal weight);
    }

    // Estratégias concretas
    public class FedExShipping : IShippingStrategy
    {
        public decimal Calculate(decimal weight) => weight * 2.5m;
    }

    public class UPSShipping : IShippingStrategy
    {
        public decimal Calculate(decimal weight) => weight * 3.0m + 10;
    }

    // Contexto que usa a estratégia
    public class ShippingOrder
    {
        private IShippingStrategy _shippingStrategy;
        public decimal Weight { get; private set; }

        public ShippingOrder(decimal weight, IShippingStrategy shippingStrategy)
        {
            Weight = weight;
            _shippingStrategy = shippingStrategy;
        }

        public decimal CalculateShipping()
        {
            return _shippingStrategy.Calculate(Weight);
        }

        public void SetShippingStrategy(IShippingStrategy strategy)
        {
            _shippingStrategy = strategy; // trocar estratégia em runtime
        }
    }


    #endregion

    #region Observer -> eventos e notificações (Behavioral)
    // Notifica múltiplos objetos quando algo muda
    interface IObserver
    {
        void Update(string message);
    }

    class Publisher
    {
        private List<IObserver> observers = new List<IObserver>();

        public void Subscribe(IObserver observer) => observers.Add(observer);
        public void Unsubscribe(IObserver observer) => observers.Remove(observer);

        public void Notify(string message)
        {
            foreach (var o in observers)
            {
                o.Update(message);
            }
        }
    }

    class EmailSubscriber : IObserver
    {
        public void Update(string message) => Console.WriteLine("email " + message);
    }

    class SmsSubscriber : IObserver
    {
        public void Update(string message) => Console.WriteLine("Message" + message);
    }

    class TestingSubscriber
    {
        static void Main()
        {
            var publisher = new Publisher();

            publisher.Subscribe(new EmailSubscriber());
            publisher.Subscribe(new SmsSubscriber());

            publisher.Notify("Nova notícia");
        }
    }

    #endregion

    #region Decorator -> adicionar comportamentos sem herança (Structural)
    // Adiciona funcionalidades a objetos dinamicamente

    // Interface base
    public interface IMessage
    {
        string GetText();
    }

    // Classe concreta
    public class SimpleMessage : IMessage
    {
        private string _text;
        public SimpleMessage(string text) => _text = text;

        public string GetText() => _text;
    }

    // Decorator abstrato
    public class MessageDecorator : IMessage
    {
        protected IMessage _message;
        public MessageDecorator(IMessage message) => _message = message;
        public virtual string GetText() => _message.GetText();
    }

    // Decorators concretos
    public class PrefixDecorator : MessageDecorator
    {
        public PrefixDecorator(IMessage message) : base(message) { }

        public override string GetText() => "Prefix: " + _message.GetText();
    }

    public class SuffixDecorator : MessageDecorator
    {
        public SuffixDecorator(IMessage message) : base(message) { }

        public override string GetText() => _message.GetText() + " :Suffix";
    }

    public class TestingDecorator
    {
        public void Main()
        {
            IMessage message = new SimpleMessage("Hello");
            Console.WriteLine(message.GetText()); // Hello

            message = new PrefixDecorator(message);
            Console.WriteLine(message.GetText()); // Prefix: Hello

            message = new SuffixDecorator(message);
            Console.WriteLine(message.GetText()); // Prefix: Hello  :Suffix

        }
    }

    #endregion

    #region Facade (Structural)
    // Subsistemas
    public class Amplifier { public void On() => Console.WriteLine("Amplifier On.."); }
    public class DVDPlayer { public void On() => Console.WriteLine("DVDPlayer On.."); }
    public class Projector { public void On() => Console.WriteLine("Projector On.."); }
    public class Lights { public void Dim(int level) => Console.WriteLine($"Lights dimmed to {level}%"); }

    // Facade
    public class TheaterFacade
    {
        private readonly Amplifier amp;
        private readonly DVDPlayer dvd;
        private readonly Projector projector;
        private readonly Lights lights;

        public TheaterFacade(Amplifier amp, DVDPlayer dvd, Projector projector, Lights lights)
        {
            this.amp = amp;
            this.dvd = dvd;
            this.projector = projector;
            this.lights = lights;
        }

        public void WatchMovie()
        {
            Console.WriteLine("Get ready to watch a movie...");
            lights.Dim(10);
            projector.On();
            amp.On();
            dvd.On();
        }
    }

    public class TestFacade
    {
        public void Main()
        {
            var theater = new TheaterFacade(
                new Amplifier(),
                new DVDPlayer(),
                new Projector(),
                new Lights()
            );

            theater.WatchMovie();
        }
    }

    #endregion
}
