import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
/*
Reemplazar palabras específicas en un archivo. Desarrolla un programa que
lea un archivo de texto, reemplace todas las apariciones de una palabra
específica (por ejemplo, "hola") por otra palabra (por ejemplo, "adiós"), y
guarde el resultado en un nuevo archivo.
 */
public class Ejercicio_23 {
    public static void main(String[] args) {
        try (BufferedReader br = new BufferedReader(new FileReader("Archivos ejercicios/archivo1.txt"))) {
            String linea;
            String cambio="Lenguaje";
            while ((linea = br.readLine()) != null) {
                linea.replaceAll("^[Java]$",cambio);
                System.out.println(linea);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
