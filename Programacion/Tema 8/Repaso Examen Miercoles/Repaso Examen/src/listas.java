import java.util.ArrayList;
import java.util.List;

public class listas {
    public static void main(String[] args) {
        List<String> lista=new ArrayList<>();
        lista.add("Hola");
        lista.add("que");
        lista.add("tal");
        lista.add("estas");
        lista.add("hoy");
        lista.add("querida");
        lista.forEach(elemento -> System.out.println(elemento));



    }
}
