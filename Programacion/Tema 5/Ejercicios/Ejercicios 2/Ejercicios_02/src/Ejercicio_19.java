import java.util.Scanner;

public class Ejercicio_19 {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.println("Dime varios numeros separados por comas ");
        String numeros= scanner.nextLine();
        int suma=0;
        String[] numerota= numeros.split(",");
        for (int i=0;i<numerota.length;i++){
            suma=suma+ Integer.valueOf(numerota[i]);
            System.out.println(suma);
        }
    }
}
