import java.util.Scanner;

public class Ejercicio_20 {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.println("Dime una frase ");
        String frase= scanner.nextLine();
        char[] letras=frase.toCharArray();
        int contador=0;
        for (int i=0;i<letras.length;i++){
            if (letras[i]=='s' || letras[i]=='S'){
                contador ++;
                System.out.println("La posicion de la s es "+i);
            }
        }
        System.out.println("La s aparece "+contador+" veces");
    }
}
