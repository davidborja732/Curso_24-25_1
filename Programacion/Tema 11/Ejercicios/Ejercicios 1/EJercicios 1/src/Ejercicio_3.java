import java.util.*;

public class Ejercicio_3 {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        Random random=new Random();
        int contadoraparaciones=0;
        ArrayList<Integer> listanumeros=new ArrayList<>();
        while (listanumeros.size() < 50) {
            int numero_aleatorio = random.nextInt(0,99);
            listanumeros.add(numero_aleatorio);
        }
        System.out.println("Dime un numero ");
        int numero=scanner.nextInt();
        for (int i=0;i<listanumeros.size();i++){
            if (listanumeros.get(i).equals(numero)){
                contadoraparaciones++;
            }
        }

        System.out.println(listanumeros.toString());
        System.out.println("El numero "+numero+" Aparece "+contadoraparaciones+" vez/veces");
    }
}
