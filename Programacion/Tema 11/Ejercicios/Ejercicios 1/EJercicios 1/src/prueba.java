import java.util.Scanner;

public class prueba {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int numero;

        while (true) {
            System.out.println("Dime un número: ");
            if (scanner.hasNextInt()) {
                numero = scanner.nextInt();
                break; // Salir del bucle cuando la entrada es correcta
            } else {
                System.out.println("Entrada no válida. Inténtalo de nuevo.");
                scanner.nextLine(); // Limpiar el buffer de entrada
            }
        }

        System.out.println("Número ingresado: " + numero);
        scanner.close();
    }
}

