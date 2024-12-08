import java.util.Scanner;

public class Ejercicio_11 {
    static int factorial(int numero){
        if (numero <= 1) {
            return 1;
        } else {
            return numero * factorial(numero - 1);
        }
    }
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.println("Dime un numero ");
        int numero= scanner.nextInt();
        System.out.println(numero + "! = " + factorial(numero));
    }
}

