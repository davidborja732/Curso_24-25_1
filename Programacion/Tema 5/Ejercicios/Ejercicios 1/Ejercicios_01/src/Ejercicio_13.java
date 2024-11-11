
import java.util.ArrayList;
import java.util.Collections;
import java.util.Scanner;

public class Ejercicio_13 {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        ArrayList<String> nombres = new ArrayList<>();
        System.out.println("Dime los nombres a introducir ");
        int numeros=scanner.nextInt();
        scanner.nextLine();
        for (int i = 0;i<=numeros-1;i++){
            System.out.println("Dime un nombre ");
            String nombre= scanner.nextLine();
            nombres.add(nombre);
        }
        Collections.sort(nombres);
        System.out.println(nombres);
    }
}
