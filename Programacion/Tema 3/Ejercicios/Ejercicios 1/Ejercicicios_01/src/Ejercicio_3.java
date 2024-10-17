import java.util.Scanner;

public class Ejercicio_3 {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.print("Ingresa un caracter: ");
        char caracter = scanner.next().charAt(0);

        if (Character.isLetter(caracter)) {
            System.out.println("Es una letra.");
        } else if (Character.isDigit(caracter)) {
            System.out.println("Es un número.");
        } else {
            System.out.println("Es otro tipo de caracter");
        }
    }
}
