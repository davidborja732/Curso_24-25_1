import java.util.regex.Pattern;

public class Ejercicio_13 {
    public static void main(String[] args) {
        System.out.println(Pattern.matches("\\d{3}-\\d{3}-\\d{4}","123-670-9087"));
        System.out.println(Pattern.matches("\\d{3}-\\d{3}-\\d{4}","123-67-9087"));
    }
}
