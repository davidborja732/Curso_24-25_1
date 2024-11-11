import java.util.Scanner;

public class Ejercicio_30 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Dime la altura ");
        int altura= scanner.nextInt();
        for (int i=altura;i>=1;i--){
            for (int k=1;k<=i;k++){
                System.out.print("*");
            }
            System.out.println(" ");
        }
    }
}
