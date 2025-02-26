import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Ejercicio_9 {
    static void buscar(String regex, String texto) {
        Pattern pat = Pattern.compile(regex);
        Matcher matcher = pat.matcher(texto);
        while (matcher.find()) {
            System.out.println(matcher.group());
        }
    }

    public static void main(String[] args) {
        String texto = "IES SEGUNDO DE CHOMÓN\n" +
                "C/ Pablo Monguió, 48\n" +
                "44002 Teruel\n" +
                "Teléfono: 978 60 13 21 \n" +
                "Fax: 978 60 00 80 \n" +
                "Email: iesschteruel@educa.aragon.es\n" +
                "Web: www.iesch.org";
        String correo = "[a-zA-Z0-9_%$]{1,}@[a-zA-Z0-9_%$]{1,}.[a-zA-Z]{1,}.[a-zA-Z]{1,}|[a-zA-Z0-9_%$]{1,}@[a-zA-Z0-9_%$]{1,}.[a-zA-Z]{1,}";
        String codigo_postal = "\\d{5}";
        String Telefonos = "\\d{3} \\d{2} \\d{2} \\d{2}";
        String web = "www.[a-zA-Z0-9]{1,}.[a-zA-Z]{1,}";
        System.out.println("Correos = ");
        buscar(correo, texto);
        System.out.println("Codigo Postal = ");
        buscar(codigo_postal, texto);
        System.out.println("Telefonos = ");
        buscar(Telefonos, texto);
        System.out.println("Paginas web = ");
        buscar(web, texto);
    }
}
