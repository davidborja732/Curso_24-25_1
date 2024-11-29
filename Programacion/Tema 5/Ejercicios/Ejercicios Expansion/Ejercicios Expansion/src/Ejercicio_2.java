import java.util.Scanner;

public class Ejercicio_2 {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.println("Dime una frase ");
        String frase= scanner.nextLine();
        char[] letras= frase.toCharArray();
        int contador=0;
        char punto='.';
        char letram='s';
        char letraM='S';
        for (int i=0;i< letras.length;i++){
            if (letras[i]!=punto){
                if (letras[i]==letram || letras[i]==letraM){
                    contador++;
                }
            }else {
                break;
            }
        }
        System.out.println("El numero de s en la palabra es "+contador);
    }
}
