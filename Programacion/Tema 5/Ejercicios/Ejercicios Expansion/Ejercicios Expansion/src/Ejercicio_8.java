import java.util.Scanner;

public class Ejercicio_8 {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.println("Dime un numero ");
        /**int numero= scanner.nextInt();
        if (numero<0){
            numero=numero*-1;
        }
        StringBuilder numerooriginal=new StringBuilder(String.valueOf(numero));
        StringBuilder numeroreves= new StringBuilder(String.valueOf(numero)).reverse();
        if (numerooriginal.compareTo(numeroreves) == 0){
            System.out.println("Numero Capicua");
        }else {
            System.out.println("Numero no capicua");
        }**/
        String texto= scanner.next();
        StringBuilder numerooriginal=new StringBuilder(texto);
        StringBuilder numeroreves= new StringBuilder(texto).reverse();
        System.out.println(numerooriginal.compareTo(numeroreves) == 0);
        if (numerooriginal.compareTo(numeroreves) == 0){
            System.out.println("Numero Capicua");
        }else {
            System.out.println("Numero no capicua");
        }

    }
}
