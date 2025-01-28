import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class Ejercicio_8 {
    /**
     Desarrolla un programa que lea un archivo de texto y muestre el número
     palabras que contiene.
     **/
    public static void main(String[] args) {
        File archivo=new File("Archivos Prueba/archivo1");
        int contador=0;
        try {
            Scanner scan = new Scanner(archivo);
            while (scan.hasNextLine()) {
                String linea = scan.nextLine();
                String[] palabras = linea.split(" ");
                contador += palabras.length;
            }
            System.out.println("El archivo tiene "+contador+" palabras");

        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
