import java.io.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Ejercicio_2 {
    public static void main(String[] args) throws FileNotFoundException {
        //indico el fichero del que voy a leer
        File fichero=new File("Archivos/Languages for Data Science.txt");
        //Leo el fichero con un bufferreader
        try (BufferedReader bufferedReader=new BufferedReader(new FileReader(fichero))){
            String linea;
            //inicio contador que guardara las veces que aparace en el texto
            int contador=0;
            //Leo mientras haya lineas si no hay mas lineas finaliza while
            while((linea= bufferedReader.readLine())!=null){
                //Regex para comprobar las veces que se menciona
                Pattern pattern=Pattern.compile("\\b[R]\\b");
                //Compruebo si la linea cumple el regex
                Matcher matcher= pattern.matcher(linea);
                //mientras cumpla el regex la linea se sumara 1 al contador
                while (matcher.find()){
                    contador++;
                }
            }
            //devuelvo las veces que aparece
            System.out.println("El lenguaje de programacion R es mencionado "+contador);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
