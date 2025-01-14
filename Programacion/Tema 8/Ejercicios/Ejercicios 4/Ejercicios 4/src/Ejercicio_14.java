import java.util.regex.Matcher;
import java.util.regex.Pattern;

/*
Detectar palabras que empiezan con una letra mayúscula. Desarrolla una
expresión regular que detecte todas las palabras que comienzan con una letra
mayúscula en una cadena de texto. Considera las palabras separadas por espacios.
 */
public class Ejercicio_14 {
    public static void main(String[] args) {
        String cadena="Hola mundo Que tal";
        Pattern pattern = Pattern.compile("[A-Z]{1}[a-z]{1,}");
        Matcher matcher= pattern.matcher(cadena);
        while (matcher.find()){
            System.out.println(matcher.group());
        }
    }
}
