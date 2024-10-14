import java.util.Scanner;

public class Ejercicio_1 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Dime la base");
        int base=scanner.nextInt();
        System.out.println("Dime la altura");
        int altura=scanner.nextInt();
        System.out.println("El area es "+base*altura);
    }
}
