import java.util.Scanner;

public class Ejercicio_22 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Introduce una frase: ");
        String frase = scanner.nextLine();
        System.out.println(frase.toUpperCase().trim());
        System.out.println(frase.toLowerCase().trim());
        System.out.println(PrimeraMayuscula(frase).trim());

    }

    private static String PrimeraMayuscula(String frase) {
        String[] palabras = frase.split(" ");
        String resultado = "";
        for (String palabra : palabras) {
            char primeraLetra = Character.toUpperCase(palabra.charAt(0));
            String restoPalabra =palabra.substring(1).toLowerCase();
            resultado += primeraLetra + restoPalabra + " ";
        }
        return resultado.trim();
    }

}


