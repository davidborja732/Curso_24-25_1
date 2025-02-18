import java.util.*;

public class Ejercicio_3 {
    public static ArrayList<Integer> lista=new ArrayList<>();
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.println("Dime un numero del 0 al 20 ");
        int numero=0;
        if (scanner.hasNextInt()){
            numero=scanner.nextInt();
            while (numero<=0 | numero>20) {
                System.out.println("Introduce un numero dentro del rango");
                numero= scanner.nextInt();
            }
        }
        Random random=new Random();
        int numeroaleatorio;
        int contador=0;
        while (contador!=numero){
            numeroaleatorio= random.nextInt(0,50);
            lista.add(numeroaleatorio);
            contador++;
        }
        System.out.println(lista.toString());
        comprobarlista();
    }

    private static void comprobarlista() {
        Ejercicio_3.lista = lista;
        boolean longitud;
        if (lista.size() > 1) {
            longitud = true;
        } else {
            longitud = false;
        }
        System.out.println("La lista tiene mas de un caracter " + longitud);
        System.out.println("Numero mas alto " + Collections.max(lista));
        System.out.println("Numero mas bajo " + Collections.min(lista));
        ArrayList<Integer> listarepetidos = new ArrayList<>();
        for (int i = 0; i < lista.size(); i++) {
            if (Collections.frequency(lista,lista.get(i))>1 && !listarepetidos.contains(lista.get(i))){
                listarepetidos.add(lista.get(i));
            }
        }
        System.out.println(listarepetidos.toString());
    }
}

