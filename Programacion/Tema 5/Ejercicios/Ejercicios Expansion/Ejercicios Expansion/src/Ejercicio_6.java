import java.util.Scanner;

public class Ejercicio_6 {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.println("Dime tu nombre");
        String nombre= scanner.nextLine();
        String[] primeraparte=nombre.split(" ");
        System.out.println("hola "+primeraparte[0]);
    }
}
