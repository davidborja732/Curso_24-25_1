import java.io.*;
public class Ejercicio_23 {
    public static void main(String[] args) {
        String nombreArchivoEntrada = "Archivos ejercicios/archivo1.txt";
        String nombreArchivoSalida = "Archivos ejercicios/archivo2.txt";
        String palabraReemplazar = "Java";
        String nuevaPalabra = "Lenguaje";
        try (BufferedReader reader = new BufferedReader(new FileReader(nombreArchivoEntrada));
        BufferedWriter writer = new BufferedWriter(new FileWriter(nombreArchivoSalida))) {
            String linea;
            while ((linea = reader.readLine()) != null) {
                linea = linea.replaceAll(palabraReemplazar, nuevaPalabra);
                writer.write(linea);
                writer.newLine();
            }
        } catch (IOException e) {
            System.out.println("Error al leer o escribir el archivo: " + e.getMessage());
        }
    }
}
