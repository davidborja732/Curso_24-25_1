import java.util.Scanner;

public class Ejercicio_4 {
    static void tablamulti(int numero){
        for (int i=0;i<=10;i++){
            System.out.println(numero+"*"+i+"="+numero*i);
        }
    }
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.println("Dime el numero ");
        int numero= scanner.nextInt();
        tablamulti(numero);
    }
}
