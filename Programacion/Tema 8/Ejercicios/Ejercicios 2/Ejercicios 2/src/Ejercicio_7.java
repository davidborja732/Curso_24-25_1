import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class Ejercicio_7 {
    public static void main(String[] args) throws IOException {
        String origen = "Archivos Prueba/archivo1";
        List<Character> abecedario = new ArrayList<>();
        for (char letra = 'A'; letra <= 'Z'; letra++) {
            abecedario.add(letra);
        }
        int i;
        int contador = 0;
        for (int x = 0; x < abecedario.size(); x++) {
            try (FileInputStream arorigen = new FileInputStream(origen)) {
                while ((i = arorigen.read()) != -1) {
                    String caracter = String.valueOf((char) i);
                    if (abecedario.get(x).equals(caracter.toUpperCase().charAt(0))) {
                        contador++;
                    }
                }
            }
            System.out.println("La letra " + abecedario.get(x) + " aparece " + contador + " veces.");
            contador = 0;
        }
    }
}

