package Ejercicio_3;

public class PayPal extends MetodoPago{
    private String id;
    private int saldo;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getSaldo() {
        return saldo;
    }

    public void setSaldo(int saldo) {
        this.saldo = saldo;
    }

    public PayPal(String id, int saldo) {
        this.id = id;
        this.saldo = saldo;
    }


    @Override
    String procesar_pago(int monto) {
        return "";
    }
}
