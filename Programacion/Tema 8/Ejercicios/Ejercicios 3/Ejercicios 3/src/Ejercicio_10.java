import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class Ejercicio_10 {
    static boolean buscar(String regex, String texto) {
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(texto);
        return matcher.find();
    }
    public static void main(String[] args) {
        String correo = "[a-zA-Z0-9_%$]+@[a-zA-Z0-9_%$]+\\.edu";
        String correoyahoo = "[a-zA-Z0-9_%$]+@+yahoo+.[a-zA-Z]{1,}";
        String alta = "2015-(0[5-9]|1[0-2])-[0-3][0-9]|2016-[0-1][0-9]-[0-3][0-9]|2017-0[1-2]-[0-3][0-9]";
        try (BufferedReader bu=new BufferedReader(new FileReader("Archivos Prueba/DATA.csv"))){
            String linea;
            while ((linea= bu.readLine())!=null){
                if (linea.contains("ES") || linea.contains("PT")){
                    System.out.println(linea);
                }else if (buscar(correo,linea)) {
                    System.out.println(linea);
                }else if (buscar(correoyahoo,linea)){
                    System.out.println(linea);
                }else if (buscar(alta,linea)){
                    System.out.println(linea);
                }
            }
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
