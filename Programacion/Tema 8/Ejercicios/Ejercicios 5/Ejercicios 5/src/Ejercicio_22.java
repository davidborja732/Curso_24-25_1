
import java.io.File;
import java.io.FileInputStream;
import java.util.Scanner;

public class Ejercicio_22 {
    public static void main(String[] args) {
        String archivo="Archivos ejercicios/archivo1.txt";
        Scanner scanner;
        int contador=0;
        try {
            scanner=new Scanner(new File(archivo));
            while (scanner.hasNext()){
                scanner.next();
                contador++;
            }
            System.out.println("El archivo tiene "+contador+" palabras");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
