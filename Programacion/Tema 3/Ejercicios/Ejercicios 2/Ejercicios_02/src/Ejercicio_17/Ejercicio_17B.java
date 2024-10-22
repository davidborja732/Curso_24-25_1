package Ejercicio_17;

import java.util.Scanner;

/**Modifica el programa para que devuelva también la media.**/
public class Ejercicio_17B {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        int suma=0;
        int respuesta=0;
        for (int i = 1; i <= 12; i++) {
            System.out.println("Dime la facturacion para el mes "+i);
            respuesta= scanner.nextInt();
            suma=suma+respuesta;
        }
        System.out.println("El total es "+suma);
        System.out.println("La media es "+suma/12+" euros de media al mes");
    }
}
