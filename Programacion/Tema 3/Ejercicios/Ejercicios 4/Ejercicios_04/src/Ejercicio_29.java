import java.util.Scanner;

public class Ejercicio_29 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Introduce el ancho del rectángulo: ");
        int ancho = scanner.nextInt();
        System.out.print("Introduce el alto del rectángulo: ");
        int alto = scanner.nextInt();

        for (int i = 0; i < alto; i++) {
            for (int k = 0; k < ancho; k++) {
                if (i == 0 || i == alto - 1 || k == 0 || k == ancho - 1) {
                    System.out.print('*');
                } else {
                    System.out.print(' ');
                }
            }
            System.out.println();
        }
    }
}
