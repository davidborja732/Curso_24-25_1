import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Ejercicio_1 {
    public static void main(String[] args) {
        //Inicio scanner
        Scanner scanner=new Scanner(System.in);
        String frase=" ";
        char primeraletra;
        char ultimaletra = 0;
        while (frase!=null){
            System.out.println("Dime una frase ");
            //Recogo la frase del usuario
            frase= scanner.nextLine();
            //Regex para obtener ultima letra
            Pattern pattern=Pattern.compile("[a-zA-Z][?._;!¡]");
            //Regex para obtener primera letra
            Pattern pattern2=Pattern.compile("[¿?._;!¡][a-zA-Z]");
            //comprueba cuál es la primera letra con un matcher y un matcher, group y le asigno esa letra a la variable primera letra
            Matcher matcherprimeraletra = pattern2.matcher(frase);
            if (matcherprimeraletra.find()){
                primeraletra= matcherprimeraletra.group().charAt(1);
            }else {
                primeraletra=frase.charAt(0);
            }
            //Si hay una coincidencia el programa entra en este if me muestra un mensaje por pantalla y finaliza el programa
            if (String.valueOf(primeraletra).toLowerCase().equals(String.valueOf(ultimaletra).toLowerCase())){
                System.out.println("¡Coincidencia detectada! Finalizacion del programa");
                System.exit(1);
            }
            //comprueba cual es la ultima letra con un matcher y un matcher.group y le asigno esa letra a la variable ultimaletra
            Matcher matcherultimaletra = pattern.matcher(frase);
            if (matcherultimaletra.find()){
                ultimaletra= matcherultimaletra.group().charAt(0);
            }else {
                ultimaletra=frase.charAt(frase.length()-1);
            }
        }
    }
}
