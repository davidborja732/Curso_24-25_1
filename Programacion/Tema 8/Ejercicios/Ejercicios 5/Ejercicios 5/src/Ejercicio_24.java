import java.io.*;
public class Ejercicio_24 {
    public static String darvuelta(String linea){
        if (linea==null){
            return linea;
        }
        String reves="";
        for (int i = linea.length()-1;i >=0;i--){
            reves=reves+linea.charAt(i);
        }
        return reves;
    }
    public static void main(String[] args) {
        String nombreArchivoEntrada = "Archivos ejercicios/archivo1.txt";
        String nombreArchivoSalida = "Archivos ejercicios/archivo3.txt";
        String palabraReemplazar = "Java";
        String nuevaPalabra = "Lenguaje";
        try (BufferedReader reader = new BufferedReader(new FileReader(nombreArchivoEntrada));
             BufferedWriter writer = new BufferedWriter(new FileWriter(nombreArchivoSalida))) {
            String linea;
            while ((linea = reader.readLine()) != null) {
                linea=darvuelta(linea);
                writer.write(linea);
                writer.newLine();
            }
            System.out.println("Archivo copiado");
        } catch (IOException e) {
            System.out.println("Error al leer o escribir el archivo: " + e.getMessage());
        }
    }
}
