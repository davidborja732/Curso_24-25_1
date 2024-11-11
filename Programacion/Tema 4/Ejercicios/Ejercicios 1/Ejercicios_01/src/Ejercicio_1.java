import java.util.Scanner;

public class Ejercicio_1 {
    static void signo(float numero){
        if (numero==0){
            System.out.println(0);
        } else if (numero>0) {
            System.out.println(1);
        }else {
            System.out.println(-1);
        }
    }
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.println("Dime el numero ");
        float numero= scanner.nextFloat();
        signo(numero);
    }
}
