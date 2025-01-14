import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.*;

public class Ejercicio_4 {
    public static void main(String[] args) {
        String ruta = "Archivos Prueba/archivo1";
        File archivo = new File(ruta);

        try (BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream(archivo), StandardCharsets.UTF_8))) {
            String linea;
            while ((linea = reader.readLine()) != null) {
                System.out.println(linea);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
