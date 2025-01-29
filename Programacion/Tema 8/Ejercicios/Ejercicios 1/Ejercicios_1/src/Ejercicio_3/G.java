package Ejercicio_3;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

/*
Borre el archivo Programacion(+2).txt que se encuentra en la carpeta
/PRO_UD08_Ej03.
 */
public class G {
    public static void main(String[] args) {
        File archivo=new File("Archivos_Ejercicios/Programacion2.txt");
        try {
            Files.delete(archivo.toPath());
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
