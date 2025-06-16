import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class REgex {
    public static void main(String[] args) {
        String texto="45";
        String regex="\\d+";
        /*Pattern pattern=Pattern.compile(regex);
        Matcher matcher= pattern.matcher(texto);
        while (matcher.find()){
            //System.out.println(matcher.group());
        }*/
        System.out.println(Pattern.matches(regex,texto));


    }
}
