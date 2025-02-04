package Ejercicio_3;

public class TransferenciaBancaria extends MetodoPago{
    private int transfer;
    private int saldo;

    public int getSaldo() {
        return saldo;
    }

    public void setSaldo(int saldo) {
        this.saldo = saldo;
    }

    public int getTransfer() {
        return transfer;
    }

    public void setTransfer(int transfer) {
        this.transfer = transfer;
    }

    public TransferenciaBancaria(int transfer, int saldo) {
        this.transfer = transfer;
        this.saldo = saldo;
    }

    @Override
    String procesar_pago(int monto) {
        return "El usuario con la transferencia"+transfer+" con el saldo "+saldo+ " con transferencia por valor de  "+monto+
                " Tiene un saldo ahora de "+(saldo-monto)+" euros";
    }
}
