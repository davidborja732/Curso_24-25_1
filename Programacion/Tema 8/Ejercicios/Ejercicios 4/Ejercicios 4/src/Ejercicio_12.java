import java.util.regex.Pattern;

public class Ejercicio_12 {
    public static void main(String[] args) {
        String correo="david@gmail.com";
        String correo2="david+çmail.com";
        System.out.println(Pattern.matches("^[a-zA-z0-9._%+-]{1,}@[a-zA-z0-9.-]+\\.[a-zA-Z]{2,}$",correo));
        System.out.println(Pattern.matches("^[a-zA-z0-9._%+-]{1,}@[a-zA-z0-9.-]+\\.[a-zA-Z]{2,}$",correo2));
    }
}
