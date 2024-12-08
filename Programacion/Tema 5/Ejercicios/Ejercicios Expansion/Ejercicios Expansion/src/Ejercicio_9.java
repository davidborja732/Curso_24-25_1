import java.util.Scanner;

public class Ejercicio_9 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Dime una frase ");
        String frase = scanner.nextLine().trim();
        System.out.println(frase);
        char[] frasemayus = frase.toCharArray();
        for (int i = 0; i < frasemayus.length; i++) {
            if (i == 0 || frasemayus[i - 1] == ' ') {
                frasemayus[i] = Character.toUpperCase(frasemayus[i]);
            }
        }
        System.out.println(String.valueOf(frasemayus));
    }
}

