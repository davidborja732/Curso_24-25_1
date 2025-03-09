import java.util.*;

public class Hashmap {
    public static void main(String[] args) {
        /**Map<Integer,String> lista=new HashMap<>();
        lista.put(1,"Jose");
        lista.put(2,"Jose");
        lista.put(3,"Pepe");
        lista.put(4,"Antonia");
        lista.put(5,"Luisa");
        for (Map.Entry<Integer, String> elemento : lista.entrySet()) {
            System.out.println(elemento.getKey()+" "+elemento.getValue());
        }**/
        //Hashset
        HashSet<String> lista=new HashSet<>();
        lista.add("Jose");
        lista.add("Jose");
        lista.add("Pepe");
        lista.add("Antonia");
        lista.add("Luisa");
        Iterator<String> iterator= lista.iterator();
        while (iterator.hasNext()){
            System.out.println(iterator.next());
        }
    }
}
