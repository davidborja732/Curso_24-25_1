import java.util.Scanner;

public class Ejercicio_9 {
    static void cuentaatras(int numero) {
        System.out.println(numero);
        numero = numero - 1;
        if (numero==0){
            System.out.println(0);
            System.exit(1);
        }
        cuentaatras(numero);

    }
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.println("Dime un numero ");
        int numero= scanner.nextInt();
        cuentaatras(numero);

    }
}
