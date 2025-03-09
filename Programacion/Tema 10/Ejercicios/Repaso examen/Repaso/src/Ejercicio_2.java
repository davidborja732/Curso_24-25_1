import java.util.ArrayList;
import java.util.Collections;
import java.util.Scanner;

public class Ejercicio_2 {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        ArrayList <Integer> lista=new ArrayList<>();
        ArrayList<Integer> listaordenada=new ArrayList<>();
        int numero;
        while (lista.size()<5){
            System.out.println("Dime un numero ");
            if (scanner.hasNextInt()){
                numero=scanner.nextInt();
                lista.add(numero);
                listaordenada.add(numero);
            }else {
                scanner.next();
            }
        }
        Collections.sort(listaordenada);
        if (lista.equals(listaordenada)){
            System.out.println("Esta ordenada");
        }else {
            System.out.println("No esta ordenada");
        }
    }
}
