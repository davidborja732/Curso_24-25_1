package Ejercicio_17;

import java.util.Scanner;

/**Modifica el programa para que devuelva el mes con mayor
 facturación y el valor de ésta. **/
public class Ejercicio_17C {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        int suma=0;
        int respuesta=0;
        int respuestamax=0;
        int mes=0;
        for (int i = 1; i <= 12; i++) {
            System.out.println("Dime la facturacion para el mes "+i);
            respuesta= scanner.nextInt();
            suma=suma+respuesta;
            if (respuestamax<respuesta){
                respuestamax=respuesta;
                mes=i;
            }
        }
        System.out.println("El total es "+suma);
        System.out.println("La media es "+suma/12+" euros de media al mes");
        System.out.println("El mes "+mes+" con "+respuestamax+" de euros fue el mes de mas facturacion");
    }
}
