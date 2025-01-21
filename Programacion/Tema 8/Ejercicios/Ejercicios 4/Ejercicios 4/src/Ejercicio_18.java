import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Ejercicio_18 {
    public static void main(String[] args) {
        String frase ="La Temperatura es veinte grados y la humedad es de un ochenta o Menos";
        Pattern pattern=Pattern.compile("[A-Z]{1}[a-z]{4,}|[a-z]{5,}");
        Matcher matcher= pattern.matcher(frase);
        while (matcher.find()){
            System.out.println("Palabras= "+matcher.group());
        }
    }
}
