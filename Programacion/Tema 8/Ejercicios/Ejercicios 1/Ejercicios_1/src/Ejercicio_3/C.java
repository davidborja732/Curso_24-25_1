package Ejercicio_3;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class C {
    public static void main(String[] args) {
        Path orginal=Paths.get("Archivos_Ejercicios/docs");
        Path exercises=orginal.resolve("exercises");
        try {
            Files.createDirectories(exercises);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
