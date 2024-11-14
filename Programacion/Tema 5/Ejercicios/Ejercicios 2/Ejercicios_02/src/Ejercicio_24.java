import java.util.Arrays;
import java.util.Scanner;

public class Ejercicio_24 {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.println("Dime una palabra" );
        String palabra= scanner.next();
        String[] palabrainvertida=new String[palabra.length()];
        int numero=palabra.length();
        for (int i=0;i<palabrainvertida.length;i++){
            numero--;
            palabrainvertida[i]= String.valueOf(palabra.charAt(numero));
        }
        String palabrareves=new String(Arrays.toString(palabrainvertida));
        if (palabra==palabrareves){
            System.out.println("Es un palindromo ");
        }else {
            System.out.println("No lo es ");
        }
    }
}
