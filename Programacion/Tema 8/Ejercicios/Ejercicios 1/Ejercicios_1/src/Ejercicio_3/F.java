package Ejercicio_3;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

/*
Renombre el fichero Programacion(+1).txt como Programacion.txt en
/PRO_UD08_Ej03
 */
public class F {
    public static void main(String[] args) {
        File archivoori=new File("Archivos_Ejercicios/Programacion1.txt");
        File archivoue=new File("Archivos_Ejercicios/Programacion.txt");
        try {
            Files.move(archivoori.toPath(),archivoue.toPath(), StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
