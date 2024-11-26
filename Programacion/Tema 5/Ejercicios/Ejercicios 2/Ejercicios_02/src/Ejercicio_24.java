import java.text.Normalizer;
import java.util.Scanner;
import java.util.regex.Pattern;


public class Ejercicio_24 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Dime una palabra ");
        String palabra=remove1(scanner.next());
        String palabrareves = new StringBuilder(palabra).reverse().toString();
        if (palabra.equalsIgnoreCase(palabrareves)) {
            System.out.println("Es palindromo");
        } else {
            System.out.println("No es palindromo");
        }
    }

    static String remove1(String texto) {
        String original = "ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØÙÚÛÜÝßàáâãäåæçèéêëìíîïðñòóôõöøùúûüýÿ";
        // Cadena de caracteres ASCII que reemplazarán los originales.
        String ascii = "AAAAAAACEEEEIIIIDNOOOOOOUUUUYBaaaaaaaceeeeiiiionoooooouuuuyy";
        String output = texto;
        for (int i = 0; i < original.length(); i++) {
            // Reemplazamos los caracteres especiales.

            output = output.replace(original.charAt(i), ascii.charAt(i));

        }
        return output;
    }
}
