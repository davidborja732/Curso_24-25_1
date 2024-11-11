package Ejercicio_17;
import java.util.Scanner;
/**Modifica el programa para que devuelva el mes con menor
 facturación y el valor de ésta.  **/
public class Ejercicio_17D {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        int suma=0;
        int respuesta=0;
        int respuestamax=0;
        int mesmax=0;
        int respuestamin=Integer.MAX_VALUE;/**Es el valor de INT maximo que java puede representar **/
        int mesmin=0;
        for (int i = 1; i <= 12; i++) {
            System.out.println("Dime la facturacion para el mes "+i);
            respuesta= scanner.nextInt();
            suma=suma+respuesta;
            if (respuestamax<respuesta){
                respuestamax=respuesta;
                mesmax=i;
            }
            if (respuesta < respuestamin) {
                respuestamin = respuesta;
                mesmin = i;
            }
        }
        System.out.println("El total es "+suma);
        System.out.println("La media es "+suma/12+" euros de media al mes");
        System.out.println("El mes "+mesmax+" con "+respuestamax+" de euros fue el mes de mas facturacion");
        System.out.println("El mes "+mesmin+" con "+respuestamin+" de euros fue el mes de menos facturacion");
    }
}
