import java.util.Scanner;
public class Ejercicio_2_David_Borja {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.print("Dime un numero ");//Pido numeros al usuario
        int numero1= scanner.nextInt();
        System.out.print("Dime un numero ");//Pido numeros al usuario
        int numero2= scanner.nextInt();
        System.out.print("Dime un numero ");//Pido numeros al usuario
        int numero3= scanner.nextInt();
        int valor_maximo=Math.max(numero1,Math.max(numero2,numero3));//Compruebo valor maximo
        int valor_minimo=Math.min(numero1,Math.min(numero2,numero3));//Compruebo valor minimo
        int valor_medio=(numero1+numero2+numero3)-valor_maximo-valor_minimo;//Compruebo valor medio
        System.out.println(valor_maximo+" "+valor_medio+" "+valor_minimo);//Imprimo los numeros
    }
}
