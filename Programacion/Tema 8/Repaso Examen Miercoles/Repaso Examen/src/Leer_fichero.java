import java.io.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Leer_fichero {
    public static void main(String[] args) throws IOException {
        File archivo=new File("Ficheros prueba/prueba.txt");
        try (BufferedReader buffer=new BufferedReader(new FileReader(archivo))) {
            String datos;
            while ((datos= buffer.readLine())!=null){
                Pattern pattern=Pattern.compile("[a-zA-Záéíóú]{1,}e[a-záéíóú]{1,}");
                Matcher matcher= pattern.matcher(datos);
                while (matcher.find()){
                    System.out.println(matcher.group());
                }
            }
        }
    }
}
