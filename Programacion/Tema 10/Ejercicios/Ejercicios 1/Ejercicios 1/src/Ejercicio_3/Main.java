package Ejercicio_3;
public class Main {
    public static void main(String[] args) {
        TarjetaCredito tarjetaCredito=new TarjetaCredito("Jose",2000);
        PayPal payPal=new PayPal("Usuario_Paypal",5200);
        TransferenciaBancaria transferenciaBancaria=new TransferenciaBancaria(854552,8058);
        tarjetaCredito.procesar_pago(549);
        payPal.procesar_pago(642);
        transferenciaBancaria.procesar_pago(140);
    }
}