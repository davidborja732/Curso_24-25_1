package Ejercicio_17;

import java.util.Scanner;

/**Realiza un programa que pida introducir la facturación de una
empresa para los 12 meses del año y devuelva por pantalla el total
anual al finalizar.**/
public class Ejercicio_17A {
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
    }
}
