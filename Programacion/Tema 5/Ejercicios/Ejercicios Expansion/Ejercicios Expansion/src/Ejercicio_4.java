import java.util.ArrayList;
import java.util.Collections;
import java.util.Scanner;

public class Ejercicio_4 {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        ArrayList<Integer> numeros=new ArrayList<>();
        boolean cierto=true;
        while (cierto){
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
        Collections.sort(numeros);
        System.out.println(numeros);
        System.out.println("Los dos numeros mas mayores son ");
        for (int i=numeros.toArray().length-1;i>=numeros.toArray().length-2;i--) {
            System.out.print(numeros.get(i) + " ");
        }
    }
}
