import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;

public class Ejercicio_26 {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.println("Dime la longitud a comprobar ");
        int palabra= scanner.nextInt();
        try {
            BufferedReader bufferedReader=new BufferedReader(new FileReader("Archivos ejercicios/archivo1.txt"));
            String linea;
            int contador=0;
            String[] palabras;
            while ((linea=bufferedReader.readLine())!=null){
                palabras=linea.split(" ");
                for (String palabracom:palabras){
                    if (palabracom.length()==palabra){
                        contador++;
                    }
                }
            }
            System.out.println("El numero de palabras con esa longitud es "+contador);
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }
}
