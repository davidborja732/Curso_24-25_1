import java.util.Scanner;
public class Ejercicio_17 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Dime una frase ");
        String frase = scanner.nextLine();
        String resultado = frase.replaceAll(" ", "");
        System.out.println(resultado);
    }
}
