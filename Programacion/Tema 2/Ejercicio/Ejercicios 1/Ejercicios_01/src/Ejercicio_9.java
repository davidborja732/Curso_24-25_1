import java.util.Scanner;

public class Ejercicio_9 {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.println("Dime un numero");
        int numero1= scanner.nextInt();
        System.out.println("Dime un numero");
        int numero2= scanner.nextInt();
        System.out.println(Math.pow(numero1,numero2));
    }
}
