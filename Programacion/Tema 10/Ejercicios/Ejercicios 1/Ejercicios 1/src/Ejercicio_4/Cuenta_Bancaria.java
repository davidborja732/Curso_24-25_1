package Ejercicio_4;

public class Cuenta_Bancaria {
    private int numeroCuenta;
    private String titular;
    private int saldo;

    public Cuenta_Bancaria(int numeroCuenta, String titular, int saldo) {
        this.numeroCuenta = numeroCuenta;
        this.titular = titular;
        this.saldo = saldo;
    }

    public int getSaldo() {
        return saldo;
    }

    public void setSaldo(int saldo) {
        this.saldo = saldo;
    }

    public int getNumeroCuenta() {
        return numeroCuenta;
    }

    public void setNumeroCuenta(int numeroCuenta) {
        this.numeroCuenta = numeroCuenta;
    }

    public String getTitular() {
        return titular;
    }

    public void setTitular(String titular) {
        this.titular = titular;
    }
    public double depositar(double monto){
        saldo = (int) (saldo+monto);
        return saldo;
    }
    public double retirar(double monto){
        saldo = (int) (saldo-monto);
        return saldo;
    }
    public String mostrarsaldo(){
        return "Tu saldo es "+saldo;
    }
}
