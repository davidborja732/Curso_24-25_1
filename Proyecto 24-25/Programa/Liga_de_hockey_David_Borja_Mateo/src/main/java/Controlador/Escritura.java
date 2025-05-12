package Controlador;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class Escritura {
    public Escritura() {
    }
    public void escribir(File fichero_escribir,String texto_escribir){
        try (BufferedWriter bufferedWriter=new BufferedWriter(new FileWriter(fichero_escribir,true))){
            bufferedWriter.write(texto_escribir);
            bufferedWriter.newLine();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
