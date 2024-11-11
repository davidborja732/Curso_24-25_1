import java.util.Scanner;

public class Ejercicio_32 {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.println("Dime el numero ");
        int numero= scanner.nextInt();
        for (int i=2;i<numero;i++){
            if (numero%i==0){
                System.out.print(i+" ");
            }
        }
    }
}
