import java.util.Scanner;

public class Ejercicio_33 {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.println("Dime el numero ");
        int numero=scanner.nextInt();
        for (int i=2;i<numero;i++){
            while (numero%i==0){
                System.out.println(numero+" | "+i);
                numero/=i;
            }
        }
        if (numero>1){
            System.out.println(numero+" | "+numero);
        }
        System.out.println(1);
    }
}
