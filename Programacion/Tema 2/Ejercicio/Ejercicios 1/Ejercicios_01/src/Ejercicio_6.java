import java.util.Scanner;

public class Ejercicio_6 {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.println("Dime el numero");
        int numero1= scanner.nextInt();
        System.out.println("Dime el numero");
        int numero2 = scanner.nextInt();
        System.out.println("Mayor "+Math.max(numero1,numero2));
        System.out.println("Menor "+Math.min(numero1,numero2));
        Boolean comprobar=(Math.max(numero1,numero2)%Math.min(numero1,numero2)==0);
        System.out.println("Multiplo "+comprobar);
    }
}
