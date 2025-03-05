import java.util.ArrayList;
import java.util.HashSet;
import java.util.Random;

public class Ejercicio_6 {
    public static void main(String[] args) {
        Random random=new Random();
        ArrayList<Integer> listanumeros=new ArrayList<>();
        while (listanumeros.size() < 30) {
            int numero_aleatorio = random.nextInt(0,99);
            listanumeros.add(numero_aleatorio);
        }
        HashSet<Integer> lista=new HashSet<>();
        for (int i =0;i<listanumeros.size();i++){
            lista.add(listanumeros.get(i));
        }
        System.out.println(listanumeros.toString());
        System.out.println(lista.toString());
    }
}
