import java.util.Scanner;

public class Ejercicio_15 {
    static String alreves(String frase) {
        if (frase == null)
            return frase;
        String frasere = "";
        for (int i=frase.length()-1;i>=0;i--) {
            frasere = frasere + frase.charAt(i);
        }
        return frasere;
    }

    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.println("Dime una frase ");
        String frase= scanner.nextLine();
        System.out.println(alreves(frase));
    }
}
