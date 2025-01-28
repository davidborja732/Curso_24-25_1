import java.io.*;

public class Ejercicio_5 {
    public static void main(String[] args) {
        String origen = "Archivos Prueba/archivo1";
        String destino = "Archivos Prueba/archivo_copia(archivo1)";

        try (BufferedReader reader = new BufferedReader(new FileReader(origen));
             BufferedWriter writer = new BufferedWriter(new FileWriter(destino))) {

            String linea;
            while ((linea = reader.readLine()) != null) {
                writer.write(linea.toUpperCase());
                writer.newLine();
            }

        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}


