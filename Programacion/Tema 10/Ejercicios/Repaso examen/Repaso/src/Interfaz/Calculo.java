package Interfaz;

interface Calculo {
    public int operacion(int num1,int num2);
    default int valordefecto(){
        return 34;
    }
}
