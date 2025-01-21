import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Ejercicio_17 {
    public static void main(String[] args) {
        String frase ="La temperatura es 23.5 grados y la humedad es 60%";
        Pattern pattern=Pattern.compile("\\d{1,}.\\d{1,}|\\d{1,}|\\d{1,},\\d{1,}");
        Matcher matcher= pattern.matcher(frase);
        while (matcher.find()){
            System.out.println("Temperatura= "+matcher.group());
        }
    }
}
