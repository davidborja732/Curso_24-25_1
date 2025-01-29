package Ejercicio_3;

import java.io.File;
import java.io.IOException;
import java.nio.file.*;

/*
Copie el archivo Programacion.txt en la carpeta
/PRO_UD08_Ej03/docs/samples
 */
public class D {
    public static void main(String[] args) {
        File archivo = new File("Archivos_Ejercicios/Programacion.txt");
        Path destinoDir = Paths.get("Archivos_Ejercos/docs/samples");
        // Asegurarse de que la carpeta de destino exista
        if (!Files.exists(destinoDir)) {
            try {
                Files.createDirectories(destinoDir);
            } catch (IOException e) {
                throw new RuntimeException("Error al crear el directorio de destino: " + e.getMessage());
            }
        }

        Path destino = destinoDir.resolve(archivo.getName());

        try {
            Files.copy(archivo.toPath(), destino, StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException e) {
            throw new RuntimeException("Error al copiar el archivo: " + e.getMessage());
        }

        System.out.println("Archivo copiado exitosamente.");
    }
}

