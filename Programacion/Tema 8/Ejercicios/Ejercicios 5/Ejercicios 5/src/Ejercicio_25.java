import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;

public class Ejercicio_25 {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.println("Dime la palabra a comprobar ");
        String palabra= scanner.next();
        try {
            BufferedReader bufferedReader=new BufferedReader(new FileReader("Archivos ejercicios/archivo1.txt"));
            String linea;
            int contador=0;
            while ((linea=bufferedReader.readLine())!=null){
                if (linea.contains(palabra)){
                    contador++;
                }
            }
            System.out.println("La palabra "+palabra+" aparece en "+contador+" lineas");
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }
}
