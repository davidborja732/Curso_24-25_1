import java.io.File;

public class Listar_archivos {
    public static void main(String[] args) {
        String sourceDirectory = "Ficheros prueba";
        try {
            File sourceDir = new File(sourceDirectory);

            // Obtener todos los archivos .txt en el directorio fuente
            File[] txtFiles = sourceDir.listFiles((file, name) -> name.endsWith(".txt"));

            if (txtFiles != null && txtFiles.length > 0) {
                System.out.println("Archivos .txt encontrados:");
                for (File currentFile : txtFiles) {
                    System.out.println(currentFile.getName());
                }
            } else {
                System.out.println("No se encontraron archivos .txt en el directorio fuente.");
            }
        } catch (Exception e) {
            System.out.println("Ocurrió un error: " + e.getMessage());

        }
    }
}
