import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class Ejercicio_3 {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        Map<String,Integer> lista=new HashMap<>();
        int contador=0;
        System.out.println("Dime una frase ");
        String frase= scanner.nextLine();
        frase=frase.replaceAll(" ","");
        frase=frase.toLowerCase();
        String[] caracter=frase.split("");
        for (int i = 0; i < caracter.length; i++) {
            if (!lista.containsKey(caracter[i])){
                lista.put(caracter[i],1);
            }else{
                lista.put(caracter[i], lista.get(caracter[i]).intValue()+1);
            }
        }
        System.out.println(lista.toString());
        for (int i = 0; i < caracter.length; i++) {
            if (lista.get(caracter[i]).intValue()>1 && contador==0){
                System.out.println("El primer caracter en repetirse es "+caracter[i]);
                contador=1;
            }
        }






    }
}
