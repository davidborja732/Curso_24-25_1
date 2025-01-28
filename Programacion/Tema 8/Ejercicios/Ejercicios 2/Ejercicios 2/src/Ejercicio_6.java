import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class Ejercicio_6 {
    public static void main(String[] args) {
        String origen="Archivos Prueba/archivo1";
        try (FileInputStream arorigen = new FileInputStream(origen);){
            int i;
            int contador=0;
            while ((i= arorigen.read())!=-1){
               char caracter= (char) i;
                System.out.print(caracter);
               if (caracter=='a'||caracter=='A'){
                   contador++;
               }
            }
            System.out.println("La letra a aparece "+contador+" veces");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
