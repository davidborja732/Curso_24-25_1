package Ejercicio_3;

public class TarjetaCredito extends MetodoPago{
    private String Titular;
    private int Saldo;

    public String getTitular() {
        return Titular;
    }

    public void setTitular(String titular) {
        Titular = titular;
    }

    public int getSaldo() {
        return Saldo;
    }

    public void setSaldo(int saldo) {
        Saldo = saldo;
    }


    public TarjetaCredito(String titular, int saldo) {
        Titular = titular;
        Saldo = saldo;
    }


    @Override
    String procesar_pago(int monto) {
        return "";
    }
}
