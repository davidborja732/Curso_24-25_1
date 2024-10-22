import java.util.Scanner;

public class Ejercicio_11 {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.println("Dime un numero ");
        int numero= scanner.nextInt();
        int resta=0;
        System.out.println("Dime un numero ");
        int numero1= scanner.nextInt();
        while (numero >= numero1) {
            numero -= numero1;
            resta++;
        }
        System.out.println(resta);
    }
}
