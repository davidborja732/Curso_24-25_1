import java.util.ArrayList;

public class Filtrar {
    public static void main(String[] args) {
        ArrayList<String> nombres = new ArrayList<>();
        nombres.add("Ana");
        nombres.add("Juan");
        nombres.add("María");
        nombres.add("Pedro");
        nombres.add("Lucía");
        nombres.add("Carlos");
        nombres.add("Sofía");
        nombres.add("Miguel");
        nombres.add("Laura");
        nombres.add("Daniel");
        nombres.stream().filter(nombre -> nombre.endsWith("a")).forEach(System.out::println);

    }
}
