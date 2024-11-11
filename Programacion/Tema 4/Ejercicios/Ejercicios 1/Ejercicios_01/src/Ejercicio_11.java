import java.util.Scanner;

public class Ejercicio_11 {
    static void factorial(int numero){
        int multiplicacion=1;
        for (int i=2;i<=numero;i++){
            multiplicacion*=i;
        }
        System.out.println(multiplicacion);
    }
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.println("Dime un numero ");
        int numero= scanner.nextInt();
        factorial(numero);
    }
}
