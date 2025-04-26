package Conexiones;

import java.io.*;
import java.util.ArrayList;

public class Ficheros {
    public Ficheros() {
    }

    private final ArrayList<String> lineas_lectura=new ArrayList<>();
    public void escritura(File archivo,String texto_a_escribir){
        try(BufferedWriter bufferedWriter=new BufferedWriter(new FileWriter(archivo,true))) {
            bufferedWriter.write(texto_a_escribir);
            bufferedWriter.newLine();
        } catch (IOException e) {
            throw new RuntimeException(e);
        } ;
    }
    public void lectura(File archivo){
        try (BufferedReader bufferedReader =new BufferedReader(new FileReader(archivo))){
            String linea;
            while ((linea= bufferedReader.readLine())!=null){
                lineas_lectura.add(linea);
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<String> getLineas_lectura() {
        return lineas_lectura;
    }
}
