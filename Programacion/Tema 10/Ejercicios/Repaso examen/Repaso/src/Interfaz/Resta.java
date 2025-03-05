package Interfaz;

public class Resta implements Calculo{
    public Resta() {
    }

    @Override
    public int operacion(int num1, int num2) {
        return num1-num2;
    }

    @Override
    public int valordefecto() {
        return 45;
    }
}
