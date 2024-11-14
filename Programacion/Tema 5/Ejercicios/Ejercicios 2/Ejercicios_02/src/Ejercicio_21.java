import java.util.Scanner;

public class Ejercicio_21 {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.println("Dime una frase ");
        String frase= scanner.nextLine();
        char[] letras=frase.toCharArray();
        int contador=0;
        for (int i=0;i<letras.length;i++){
            if (letras[i]=='a' || letras[i]=='A' || letras[i]=='á' || letras[i]=='Á'){
                contador ++;
                System.out.println("La posicion de la a es "+i);
            }
        }
        System.out.println("La a aparece "+contador+" veces");
    }
}
