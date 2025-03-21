// Classe Cliente
public class Cliente {
    private String nome;

    public Cliente(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
}

// Classe Abstrata Conta
public abstract class Conta {
    private static int SEQUENCIAL = 1;
    protected int numero;
    protected double saldo;
    protected Cliente cliente;

    public Conta(Cliente cliente) {
        this.numero = SEQUENCIAL++;
        this.cliente = cliente;
    }

    public void depositar(double valor) {
        saldo += valor;
    }

    public void sacar(double valor) {
        if (saldo >= valor) {
            saldo -= valor;
        } else {
            System.out.println("Saldo insuficiente.");
        }
    }

    public void transferir(double valor, Conta contaDestino) {
        if (saldo >= valor) {
            this.sacar(valor);
            contaDestino.depositar(valor);
        } else {
            System.out.println("Saldo insuficiente para transferência.");
        }
    }

    public double getSaldo() {
        return saldo;
    }

    public int getNumero() {
        return numero;
    }

    public abstract void imprimirExtrato();
}

// Classe ContaCorrente
public class ContaCorrente extends Conta {

    public ContaCorrente(Cliente cliente) {
        super(cliente);
    }

    @Override
    public void imprimirExtrato() {
        System.out.println("=== Extrato Conta Corrente ===");
        System.out.println("Titular: " + cliente.getNome());
        System.out.println("Número: " + this.numero);
        System.out.println("Saldo: " + this.saldo);
    }
}

// Classe ContaPoupanca
public class ContaPoupanca extends Conta {

    public ContaPoupanca(Cliente cliente) {
        super(cliente);
    }

    @Override
    public void imprimirExtrato() {
        System.out.println("=== Extrato Conta Poupança ===");
        System.out.println("Titular: " + cliente.getNome());
        System.out.println("Número: " + this.numero);
        System.out.println("Saldo: " + this.saldo);
    }
}

// Classe Main para testar o sistema
public class Main {
    public static void main(String[] args) {
        Cliente cliente1 = new Cliente("João Silva");
        Conta cc = new ContaCorrente(cliente1);
        Conta cp = new ContaPoupanca(cliente1);

        cc.depositar(1000);
        cc.transferir(200, cp);

        cc.imprimirExtrato();
        cp.imprimirExtrato();
    }
}
