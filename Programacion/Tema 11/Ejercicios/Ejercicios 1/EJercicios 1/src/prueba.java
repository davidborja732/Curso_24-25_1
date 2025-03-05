import java.util.Scanner;

public class prueba {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.println("Dime un numero ");
        int numero = 0;
        if (!scanner.hasNextInt()){
            while (scanner.hasNextInt()){
                System.out.println("Dime un numero ");
                numero= scanner.nextInt();
                scanner.nextLine();
            }
        }
        System.out.println(numero);
    }
}
