import java.util.Scanner;

public class Ejercicio_5 {
    static void triangulo(int numero){
        for (int i=numero;i>=1;i--) {
            for (int k = 1; k <= i; k++) {
                System.out.print("Q");
            }
            System.out.println(" ");
        }
    }
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Dime la altura ");
        int altura= scanner.nextInt();
        triangulo(altura);
    }
}
