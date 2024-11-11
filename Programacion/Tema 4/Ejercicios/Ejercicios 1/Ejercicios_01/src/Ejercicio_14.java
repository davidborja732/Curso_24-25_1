import java.util.Scanner;

public class Ejercicio_14 {
    public static int sumarCifras(int numero) {
        int suma = 0;
        while (numero != 0) {
            suma += numero % 10;
            numero /= 10;
        }
        return suma;
    }
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.println("Dime un numero ");
        int numero=scanner.nextInt();
        System.out.println(sumarCifras(numero));
    }
}
