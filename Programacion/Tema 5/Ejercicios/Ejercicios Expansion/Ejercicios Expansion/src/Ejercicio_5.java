import java.util.ArrayList;
import java.util.Scanner;

public class Ejercicio_5 {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        ArrayList<Integer> numeros=new ArrayList<>();
        for (int i=0;i!=10;i++){
            System.out.println("Dime un numero ");
            int numero = scanner.nextInt();
            if (numero<999){
                numeros.add(numero);
            }else {
                numeros.add(0);
            }
        }
        

    }
}
