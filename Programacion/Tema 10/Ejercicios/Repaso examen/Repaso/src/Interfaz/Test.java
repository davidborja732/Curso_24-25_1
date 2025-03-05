package Interfaz;

public class Test {
    public static void main(String[] args) {
        Suma suma=new Suma();
        Resta resta=new Resta();
        System.out.println(suma.operacion(23,43));
        System.out.println(resta.operacion(23,43));
        System.out.println(suma.valordefecto());
        System.out.println(resta.valordefecto());
    }
}
