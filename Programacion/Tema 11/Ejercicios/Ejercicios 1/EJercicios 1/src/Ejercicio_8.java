
import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;

public class Ejercicio_8 {
    public static void main(String[] args) throws IOException {
        Scanner scanner=new Scanner(System.in);
        ArrayList<String> abecedario = new ArrayList<>();
        for (char letra = 'A'; letra <= 'Z'; letra++) {
            abecedario.add(String.valueOf(letra));
        }
        System.out.println("Dime una frase ");
        String frase= scanner.nextLine();
        char[] letras=frase.toCharArray();
        /**for (int i = 0; i < letras.length; i++) {
            System.out.print(letras[i]);
            System.out.print(" ");
        }**/
        System.out.println(" ");
        int contador = 0;
        for (String letra : abecedario) {
            for (int i = 0; i < letras.length - 1; i++) {
                if (letra.equals(String.valueOf(letras[i]).toUpperCase())) {
                    contador++;
                }
            }
            System.out.println(letra + " aparece " + contador + " veces.");
            contador = 0;
        }
    }
}

