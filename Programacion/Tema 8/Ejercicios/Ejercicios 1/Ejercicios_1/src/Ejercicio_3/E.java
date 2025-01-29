package Ejercicio_3;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

/*
Mueva el archivo Programacion.txt de /PRO_UD08_Ej03 a la carpeta
/PRO_UD08_Ej03/docs/exercises
 */
public class E {
    public static void main(String[] args) {
        Path destino= Paths.get("Archivos_Ejercicios/docs/exercises");
        File archivo= new File("Archivos_Ejercicios/Programacion.txt");
        Path destinos=destino.resolve(archivo.getName());
        try {
            Files.move(archivo.toPath(),destinos, StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

}
