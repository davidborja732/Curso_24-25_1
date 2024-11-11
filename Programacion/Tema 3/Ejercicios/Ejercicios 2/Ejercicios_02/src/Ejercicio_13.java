import java.util.Scanner;

public class Ejercicio_13 {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.println("Dime el numero");
        int numero= scanner.nextInt();
        String numerolon;
        if (numero>0){
           numerolon= String.valueOf(String.valueOf(numero).length());
           System.out.println(numerolon);
        }else {
            System.out.println("Introduce un numero positivo");
        }
    }
}
