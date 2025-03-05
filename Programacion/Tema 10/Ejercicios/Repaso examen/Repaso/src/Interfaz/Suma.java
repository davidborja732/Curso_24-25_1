package Interfaz;

public class Suma implements Calculo{
    public Suma() {
    }

    @Override
    public int operacion(int num1,int num2) {
        return num1+num2;
    }
}
