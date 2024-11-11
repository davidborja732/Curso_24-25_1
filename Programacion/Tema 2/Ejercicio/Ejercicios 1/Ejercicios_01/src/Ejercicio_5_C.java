import java.util.Scanner;

public class Ejercicio_5_C {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.println("Dime el numero");
        int numero1= scanner.nextInt();
        System.out.println("Dime el numero");
        int numero2 = scanner.nextInt();
        double numero=(Math.floor(Math.random()*(numero1-numero2+1)+numero2));
        System.out.println(numero);
        System.out.println("Dime el numero");
        int numero3= scanner.nextInt();
        System.out.println("Dime el numero");
        int numero4 = scanner.nextInt();
        double numero5=(Math.floor(Math.random()*(numero3-numero4+1)+numero4));
        System.out.println(numero5);
        System.out.println("Dime el numero");
        int numero6= scanner.nextInt();
        System.out.println("Dime el numero");
        int numero7 = scanner.nextInt();
        double numero8=(Math.floor(Math.random()*(numero6-numero7+1)+numero7));
        System.out.println(numero8);
    }
}
