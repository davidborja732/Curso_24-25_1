import java.util.Scanner;

public class Ejercicio_13 {
    static void fibonacci(int numero) {
        int numero1 = 0;
        int numero2 = 1;
        int fibonacci = 0;
        System.out.print(numero1 + " ");
        System.out.print(numero2 + " ");
        for (int i = 2; i < numero; i++) {
            fibonacci = numero1 + numero2;
            System.out.print(fibonacci + " ");
            numero1 = numero2;
            numero2 = fibonacci;
        }
        System.out.println();
    }
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Dime un numero: ");
        int numero = scanner.nextInt();
        fibonacci(numero);
    }
}

