package Ejercicio_3;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class B {
    public static void main(String[] args) {
        Path original= Paths.get("Archivos_Ejercicios");
        Path samples = original.resolve("docs/samples");
        try {
            Files.createDirectories(samples);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
