import java.lang.reflect.Array;
import java.util.*;

public class Ejercicio_7 {
    public static void main(String[] args) {
        ArrayList<String> lista=new ArrayList<>();
        lista.addAll(Arrays.asList("Ann", "Carol", "Mary", "Joe",
                "John", "Kevin", "Jack", "Jack", "Lucy", "Laura", "George",
                "Ann", "Johnny", "Charlie", "Hillary"));
        HashSet<String> primeralistalimpia=new HashSet<>();
        HashSet<String> segundalistalimpia=new HashSet<>();
        ArrayList<String> lista2=new ArrayList<>();
        lista2.addAll(Arrays.asList("Ann", "Martha", "Noel",
                "Mark", "Pamela", "Elisabeth", "Laura", "Jane", "Mildred",
                "Laura", "Rue", "Ann", "Jacob", "Sidney", "Sophia", "Tyler"));

        System.out.println(segundalistalimpia.toString());
        System.out.println(primeralistalimpia.toString());
        HashSet<String> listaen2Listas = new HashSet<>(lista);
        listaen2Listas.addAll(lista2);
        System.out.println("Lista 1 y 2: " + listaen2Listas );




    }
}
