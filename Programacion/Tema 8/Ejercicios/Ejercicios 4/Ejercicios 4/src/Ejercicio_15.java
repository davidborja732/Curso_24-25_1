import java.util.regex.Pattern;

public class Ejercicio_15 {
    public static void main(String[] args) {
        System.out.println(Pattern.matches("^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}" +
                "(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$","253.67.90.43"));
    }
}




