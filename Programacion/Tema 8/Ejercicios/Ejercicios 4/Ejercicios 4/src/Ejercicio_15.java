import java.util.regex.Pattern;

public class Ejercicio_15 {
    public static void main(String[] args) {
        System.out.println(Pattern.matches("^[0-255]{1,3}\\.[0-255]{1,3}\\.[0-255]{1,3}\\.[0-255]{1,3}","255.45.78.90"));
    }
}
