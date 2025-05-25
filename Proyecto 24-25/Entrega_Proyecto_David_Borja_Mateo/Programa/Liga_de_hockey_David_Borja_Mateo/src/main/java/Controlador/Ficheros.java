package Controlador;

import java.io.*;
import java.util.ArrayList;

public class Ficheros {

    /* Constructor vacio de la clase */
    public Ficheros() {
    }

    /* Lista para almacenar las lineas leidas de un archivo */
    private final ArrayList<String> lineas_lectura = new ArrayList<>();

    /* Metodo para escribir texto en un archivo */
    public void escritura(File archivo, String texto_a_escribir) {
        try (BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(archivo, true))) {
            bufferedWriter.write(texto_a_escribir); /* Escribe el texto en el archivo */
            bufferedWriter.newLine(); /* Agrega un salto de linea al final */
        } catch (IOException e) {
            throw new RuntimeException(e); /* Maneja posibles errores de escritura */
        }
    }

    /* Metodo para leer lineas desde un archivo */
    public void lectura(File archivo) {
        try (BufferedReader bufferedReader = new BufferedReader(new FileReader(archivo))) {
            String linea;
            while ((linea = bufferedReader.readLine()) != null) {
                lineas_lectura.add(linea); /* Almacena cada linea leida en la lista */
            }
        } catch (IOException e) {
            throw new RuntimeException(e); /* Maneja posibles errores de lectura */
        }
    }

    /* Metodo para obtener la lista de lineas leidas del archivo */
    public ArrayList<String> getLineas_lectura() {
        return lineas_lectura;
    }
}
