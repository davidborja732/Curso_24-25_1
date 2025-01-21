import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Ejercicio_20 {
    public static void main(String[] args) {
        String frase ="#La #Temperatura es @veinte /grados y la humeda%d es de un ochenta o Menos";
        Pattern pattern=Pattern.compile("\\b\\s*[@#%&]+\\s*\\b");
        Matcher matcher= pattern.matcher(frase);
        while (matcher.find()){
            System.out.println("Palabras con caracteres especiales= "+matcher.group());
        }
    }
}
