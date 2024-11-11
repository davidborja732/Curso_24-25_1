import java.util.Scanner;

public class Ejercicio_6 {
    static double mediaarit(int numero1,int numero2){
        return (numero1+numero2)/2;
    }
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.println("Dime el numero ");
        int numero= scanner.nextInt();
        System.out.println("Dime el numero ");
        int numero2= scanner.nextInt();
        System.out.println(mediaarit(numero,numero2));
    }
}
