import java.util.Scanner;

public class Ejercicio_2 {
    static void menor_mayor(int numero1, int numero2){
        if (numero1<numero2){
            System.out.println(numero1);
        }else {
            System.out.println(numero2);
        }
        return;
    }
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.println("Dime el numero ");
        int numero= scanner.nextInt();
        System.out.println("Dime el numero ");
        int numero2= scanner.nextInt();
        menor_mayor(numero,numero2);

    }
}
