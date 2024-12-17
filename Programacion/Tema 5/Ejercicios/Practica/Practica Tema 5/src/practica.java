import java.util.Random;
import java.util.Scanner;

public class practica {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String[] lista_palabras = { "mouse", "monitor", "desktop", "laptop", "keyboard", "software", "hardware",
                "firmware", "network", "digit", "language", "development", "program", "computer", "connector", "database",
                "query", "constraint", "disk", "protocol", "debug", "breakpoint", "source", "branch", "device", "printer" };
        Random random = new Random();
        int numero = random.nextInt(lista_palabras.length);
        String palabraadivinar = lista_palabras[numero];
        char[] listapalabra = new char[palabraadivinar.length()];
        char[] adivina = new char[palabraadivinar.length()];

        for (int i = 0; i < listapalabra.length; i++) {
            listapalabra[i] = palabraadivinar.charAt(i);
        }
        for (int i = 0; i < adivina.length; i++) {
            adivina[i] = '_';
        }

        int contadorfallos = 0;
        boolean palabraAcertada = false;
        System.out.println(palabraadivinar);
        while (contadorfallos < 8 && !palabraAcertada) {
            System.out.println("Hasta ahora llevas: " + String.valueOf(adivina));
            System.out.println("Dime una letra de la palabra");
            String letra = scanner.next().toLowerCase();
            char letra1 = letra.charAt(0);
            boolean letraacertada = false;
            for (int i = 0; i < listapalabra.length; i++) {
                if (listapalabra[i] == letra1) {
                    adivina[i] = letra1;
                    letraacertada = true;
                }
            }

            if (!letraacertada) {
                contadorfallos++;
                System.out.println("Letra incorrecta. Te quedan " + (8 - contadorfallos) + " intentos.");
            }

            // Verificar si la palabra ha sido completamente adivinada
            palabraAcertada = true;
            for (char c : adivina) {
                if (c == '_') {
                    palabraAcertada = false;
                    break;
                }
            }
        }

        if (contadorfallos == 8) {
            System.out.println("Has fallado. La palabra era: " + palabraadivinar);
        } else {
            System.out.println("¡Palabra acertada! La palabra es: " + palabraadivinar);
        }

        scanner.close();
    }
}

