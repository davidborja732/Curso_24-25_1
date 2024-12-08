import java.util.Scanner;

public class Ejercicio_1 {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        int contador=0;
        int suma=0;
        int numero=0;
        int numero1=0;
        boolean cierto=true;
       while (cierto){
           System.out.println("Dime un numero ");
           numero= scanner.nextInt();
           System.out.println(suma);
           contador++;
           suma+=numero;
           System.out.println(suma);
           if (contador>=2){
               numero1=numero;
               suma=numero+numero1;
               if (numero<suma){
                   cierto=false;
               }
           }


       }
    }
}
