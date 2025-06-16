import java.io.*;
import java.util.HashMap;
import java.util.Map;

public class Eliminar_Espacios {
    public static void main(String[] args) {
        File archivo = new File("Ficheros prueba/fichero1.txt");
        Map<String, Integer> listaConteo = new HashMap<>();

        try (BufferedReader bufferedReader = new BufferedReader(new FileReader(archivo))) {
            String linea;
            while ((linea = bufferedReader.readLine()) != null) {
                // Normalizar la línea eliminando espacios extra y caracteres de puntuación
                linea = linea.trim().replaceAll("\\s+", " ").replaceAll("[áéíóú]]","[aeiou]").toLowerCase();
                String[] palabras = linea.replaceAll("[.,¿?+*`^´}{/]", "").split(" ");

                for (String palabra : palabras) {
                    if (!palabra.equals(" ")){
                        listaConteo.put(palabra, listaConteo.getOrDefault(palabra, 0) + 1);
                    }
                }
            }
        } catch (FileNotFoundException e) {
            System.err.println("Error: Archivo no encontrado.");
        } catch (IOException e) {
            System.err.println("Error al leer el archivo: " + e.getMessage());
        }

        // Mostrar el conteo de palabras
        listaConteo.forEach((palabra, conteo) -> System.out.println(palabra + ": " + conteo));
    }
}



