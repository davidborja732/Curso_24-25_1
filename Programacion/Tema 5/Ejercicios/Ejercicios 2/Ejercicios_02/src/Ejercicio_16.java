import java.util.Scanner;

public class Ejercicio_16 {
    static int alreves(int numero) {
        int invertido = 0, resto;
        while (numero > 0) {
            resto = numero % 10;
            invertido = invertido * 10 + resto;
            numero /= 10;
        }
        return invertido;
    }

    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.println("Dime un numero ");
        int numero= scanner.nextInt();
        System.out.println(alreves(numero));
    }
}
