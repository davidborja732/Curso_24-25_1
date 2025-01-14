import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class Ejercicio_5 {
    public static void main(String[] args) throws FileNotFoundException {
        String origen="Archivos Prueba/archivo1";
        String destino="Archivos Prueba/archivo_copia(archivo1)";
        try (FileInputStream arorigen = new FileInputStream(origen);
             FileOutputStream ardestino = new FileOutputStream(destino)) {
            int i;
            while ((i= arorigen.read())!=-1){
                System.out.print((char) i);
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
