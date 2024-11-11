import java.util.Scanner;

public class Ejercicio_10 {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.println("Dime un numero ");
        int numero= scanner.nextInt();
        int suma=0;
        System.out.println("Dime un numero ");
        int numero1= scanner.nextInt();
        for (int i=0;i<numero1;i++){
            suma=suma+numero;
        }
        System.out.println(suma);
    }
}