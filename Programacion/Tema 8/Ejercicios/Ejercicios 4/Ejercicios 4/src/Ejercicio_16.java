import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Ejercicio_16 {
    public static void main(String[] args) {
        String fecha = "Hoy es 01/02/2023 No puede ser 30/09/2023 ";
        Pattern pattern = Pattern.compile("[0-31]{1,2}/[0-12]{1,2}/\\d{4}");
        Matcher matcher = pattern.matcher(fecha);
        while (matcher.find()) {
            System.out.println("Fecha= " + matcher.group());
        }
    }
}
