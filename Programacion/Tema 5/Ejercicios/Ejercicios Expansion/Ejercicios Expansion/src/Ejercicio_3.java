import java.util.Scanner;

public class Ejercicio_3 {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.println("Dime una frase ");
        String frase= scanner.nextLine();
        char[] letras= frase.toCharArray();
        int contadors=0;
        int contadordistintas=0;
        char punto='.';
        char letram='s';
        char letraM='S';
        for (int i=0;i< letras.length;i++){
            if (letras[i]!=punto){
                if (letras[i]==letram || letras[i]==letraM){
                    contadors++;
                }else {
                    contadordistintas++;
                }
            }else {
                break;
            }
        }
        System.out.println("El numero de s en la palabra es "+contadors);
        System.out.println(contadordistintas);
        System.out.println("La suma de las letras sin contar . es "+(contadors+contadordistintas));
    }
}
