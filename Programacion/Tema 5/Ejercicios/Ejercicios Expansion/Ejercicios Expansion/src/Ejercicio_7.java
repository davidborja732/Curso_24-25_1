import java.util.Scanner;

public class Ejercicio_7 {
    public static void main(String[] args) {
        Scanner scanner =new Scanner(System.in);
        boolean cierto=true;
        while (cierto){
            System.out.println("Dame un numero ");
            int numero= scanner.nextInt();
            if (numero==0){
                cierto=false;
                System.out.println("Programa Finalizado");
            }else if (numero<0) {
                continue;
            }else {
                if (numero%2==0){
                    System.out.println("El numero "+numero+" es primo.");
                }else {
                    System.out.println("El numero "+numero+" no es primo.");
                }
            }
        }
    }
}
