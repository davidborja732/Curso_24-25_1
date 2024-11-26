import java.util.Scanner;

public class Ejercicio_1 {
    public static void main(String[] args) {
        String lista="abcdefghijklmnñopqrstuwxyzABCDEFGHIJKLMNÑOPQRSTUWXYZ";
        Scanner scanner=new Scanner(System.in);
        System.out.println("Dame una lista de numeros separados por comas ");
        String listaini= scanner.nextLine();
        String[] cadena= listaini.split(",");
        System.out.println(cadena.length);

        String[] cadenanum= new String[cadena.length-1];
        System.out.println(cadenanum.length);
        for (int i=0;i<=listaini.length();i++){
            if (!lista.contains(String.valueOf(listaini.charAt(i)))){
                cadenanum[i]= String.valueOf(listaini.charAt(i));
            }
        }
        for (int i=0;i<=cadena.length-1;i++){
            System.out.println(cadenanum[i]);
        }
    }
}