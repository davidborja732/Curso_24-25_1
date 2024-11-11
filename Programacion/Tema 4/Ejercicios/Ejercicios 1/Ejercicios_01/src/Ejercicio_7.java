import java.util.Scanner;

public class Ejercicio_7 {
    static String nota(int nota){
        String valor;
        if (nota>=0 && nota<=4){
            valor="suspenso";
        } else if (nota <= 6) {
            valor="aprobado";
        } else if (nota <=8) {
            valor="Notable";
        } else {
            valor="Sobresaliente";
        }
        return valor;
    }
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.println("Dime el numero ");
        int numero= scanner.nextInt();
        if (numero >0 && numero <=10){
            System.out.println(nota(numero));
        } else {
            System.out.println("Introduce un numero del 1 al 10");
        }
    }
}
