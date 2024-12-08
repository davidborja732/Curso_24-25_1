import java.util.Scanner;

public class Ejercicio_2 {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.println("Dime una frase");
        String frase=" ";
        if (scanner.hasNextLine()){
            frase= scanner.nextLine();
        }else {
            System.out.println("Introduce una frase");
            scanner.next();
        }
        int contador=0;
        String[] palabras=frase.split(" ");
        for (int i=0;i<palabras.length;i++){
            char[] letras= palabras[i].toCharArray();
            for (int k=0;k<letras.length;k++){
                if (letras[k]=='A' || letras[k]=='a'){
                    contador++;
                }
            }
            if (contador>1){
                System.out.println(palabras[i]);
            }
            contador=0;
        }
    }
}
