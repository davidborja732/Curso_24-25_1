import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class Ejercicio_4 {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        Map<Integer,String> listapalabras=new HashMap<>();
        Integer clave = 0;
        listapalabras.put(1,"monitor");
        listapalabras.put(2,"keyboard");
        listapalabras.put(3,"trackpad");
        listapalabras.put(4,"computer");
        System.out.println(listapalabras.toString());
        System.out.println("Dime la palabra que quieres sustituir");
        String palabra= scanner.next();
        while (!listapalabras.containsValue(palabra)){
            System.out.println("Dime una palabra que este en la lista");
            palabra= scanner.next();
            scanner.nextLine();
        }
        for (Map.Entry<Integer, String> dato:listapalabras.entrySet()){
            if (dato.getValue().equals(palabra)){
                clave= dato.getKey();
            }
        }
        System.out.println("Dime la palabra por la que lo quieres sustituir ");
        String palabrasustituta=scanner.next();
        listapalabras.replace(clave,palabrasustituta);
        System.out.println(listapalabras.toString());
    }
}
