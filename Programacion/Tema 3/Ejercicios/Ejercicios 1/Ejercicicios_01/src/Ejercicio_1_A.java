import java.util.Scanner;

public class Ejercicio_1_A {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Dime la cantidas de pesetas");
        int pesetas= scanner.nextInt();
        System.out.println("La cantidad en euros es "+Math.round(pesetas/166.386));
    }
}
