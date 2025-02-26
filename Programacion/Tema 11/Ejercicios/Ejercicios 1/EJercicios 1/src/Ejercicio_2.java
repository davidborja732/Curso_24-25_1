import java.util.*;

public class Ejercicio_2 {
    public static void main(String[] args) {
        Random random=new Random();
        //Funciona
        /**ArrayList<Integer> listanumeros=new ArrayList<>();
        int contador=0;
        do {
            int numero_aleatorio= random.nextInt(3,9);
            if (!listanumeros.contains(numero_aleatorio)){

                listanumeros.add(numero_aleatorio);
                contador++;
            }
        }while (contador<3);**/
        Map<Integer, Integer> listanumeros = new HashMap<>();

        while (listanumeros.size() < 3) {
            int numero_aleatorio = random.nextInt(7) + 3;
            listanumeros.put(numero_aleatorio,listanumeros.size() + 1);
        }
        Set<Integer> claves =listanumeros.keySet();
        System.out.print("Numeros = ");
        for (Integer clave : claves) {
            System.out.print(clave+" ");
        }

    }
}
