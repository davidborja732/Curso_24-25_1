import java.util.ArrayList;
import java.util.Collections;
import java.util.Scanner;

public class Ejercicio_4 {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        ArrayList<Integer> numeros=new ArrayList<>();
        boolean cierto=true;
        while (cierto==true){
            System.out.println("Dime un numero ");
            int numero= scanner.nextInt();
            if (numero==0){
                System.out.println("Dime un numero");
                int numero2= scanner.nextInt();
                if (numero2==0){
                    cierto=false;
                }else {
                    numeros.add(numero);
                    numeros.add(numero2);
                }
            }else {
                numeros.add(numero);
            }
        }
        Collections.min(numeros);
        System.out.println(numeros);

    }
}
