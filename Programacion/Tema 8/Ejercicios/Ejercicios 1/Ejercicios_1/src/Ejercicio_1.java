import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Scanner;
/**
 • El directorio raíz del sistema de archivos que contiene el archivo.
 • El directorio donde se encuentra el archivo.
 • El nombre del archivo.
 • La extensión del archivo.
 • Si el fichero existe o no en el sistema de ficheros del ordenador.
 **/
public class Ejercicio_1 {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.println("Dime la ruta del fichero");
        String ruta= scanner.nextLine();
        Path rutausu= Paths.get(ruta);
        File archivo=new File(ruta);
        System.out.println("Directorio Raiz "+rutausu.getRoot());
        System.out.println("Directorio del archivo "+rutausu.getParent());
        System.out.println("Nombre del archivo "+rutausu.getFileName());
        System.out.println("Extension del archivo "+ruta.substring(ruta.lastIndexOf(".")));
        System.out.println("¿Existe? "+archivo.exists());
    }
}
