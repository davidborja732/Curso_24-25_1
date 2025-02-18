package Ejercicio_4;

public class Main {
    public static void main(String[] args) {
        Cuenta_Bancaria cuentaBancaria=new Cuenta_Bancaria(2356448,"Fernando",330000);
        System.out.println(cuentaBancaria.mostrarsaldo());
        System.out.println("Deposito saldo ");
        System.out.println(cuentaBancaria.depositar(2300));
        System.out.println("Retiro saldo");
        System.out.println(cuentaBancaria.retirar(254));
    }
}
