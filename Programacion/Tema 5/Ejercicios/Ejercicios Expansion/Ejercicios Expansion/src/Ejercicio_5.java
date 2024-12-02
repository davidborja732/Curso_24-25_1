import java.util.ArrayList;
import java.util.Collections;
import java.util.Scanner;

public class Ejercicio_5 {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        ArrayList<Integer> numeros=new ArrayList<>();
        for (int i=0;i!=10;i++){
            System.out.println("Dime un numero ");
            int numero = scanner.nextInt();
            if (numero<9999){
                numeros.add(numero);
            }
        }
        Collections.sort(numeros);
        System.out.print("{");
        for (int i=0;i<numeros.size();i++){
            if (numeros.get(i) <10) {
                if (i == numeros.size()-2){
                    System.out.print("000"+numeros.get(i));
                }else {
                    System.out.print("000"+numeros.get(i)+",");
                }
            } else if (numeros.get(i)<100) {
                if (i == numeros.size()-2){
                    System.out.print("00"+numeros.get(i));
                }else {
                    System.out.print("00"+numeros.get(i)+",");
                }
            } else if (numeros.get(i)<1000) {
                if (i == numeros.size()-2){
                    System.out.print("0"+numeros.get(i));
                }else {
                    System.out.print("0"+numeros.get(i)+",");
                }
            }
        }
        System.out.println("}");

    }
}
