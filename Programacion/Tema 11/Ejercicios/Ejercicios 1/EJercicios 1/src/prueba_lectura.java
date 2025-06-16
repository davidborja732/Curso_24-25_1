import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class prueba_lectura {
    public static void main(String[] args) {
        try (BufferedReader bufferedReader=new BufferedReader(new FileReader("Fichero/Metadata in DBMS.txt"))){
            String linea;
            while ((linea= bufferedReader.readLine())!=null){
                System.out.println(linea.trim().replaceAll("\\s"," "));
            }
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
