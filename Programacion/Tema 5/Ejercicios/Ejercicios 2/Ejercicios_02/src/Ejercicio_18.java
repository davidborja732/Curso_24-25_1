import java.util.Scanner;

public class Ejercicio_18 {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.println("Dime una frase ");
        String frase= scanner.nextLine();
        String[] palabras = frase.split(" ");
        for (String pala :palabras){
            System.out.println(pala);
        }
    }
}
