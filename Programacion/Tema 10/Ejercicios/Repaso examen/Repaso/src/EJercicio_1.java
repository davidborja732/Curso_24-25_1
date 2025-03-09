import java.util.ArrayList;
import java.util.Collections;
import java.util.Random;

public class EJercicio_1 {
    public static void main(String[] args) {
        Random random=new Random();
        ArrayList<Integer> lista=new ArrayList<>();
        while (lista.size()<20){
            int aleatorio= random.nextInt(0,49);
            lista.add(aleatorio);
        }
        System.out.println(lista.toString());
        int contador =0;
        for (Integer numero:lista){

            if (!(Collections.frequency(lista,numero) > 1) && contador!=1){
                System.out.println("El primer numero que no se repite es " + numero);
                contador = 1;
            }
        }
        if (contador==0) {
            System.out.println("Todos son repetidos");
        }
    }
}
