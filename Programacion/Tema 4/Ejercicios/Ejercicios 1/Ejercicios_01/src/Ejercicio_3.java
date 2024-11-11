import java.util.Scanner;

public class Ejercicio_3 {
    static void elevados(int numero, int elevacion){
        int operacion=1;
        for (int i=0;i<elevacion;i++){
            operacion=operacion*numero;
        }
        System.out.println(operacion);
    }
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.println("Dime el numero ");
        int numero= scanner.nextInt();
        System.out.println("Dime el numero ");
        int numero2= scanner.nextInt();
        elevados(numero,numero2);
    }
}
