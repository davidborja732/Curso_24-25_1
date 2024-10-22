import java.util.Locale;
import java.util.Scanner;
/**Conversor pesetas – euros. Modifica el programa de manera que el programa
pida una cantidad para convertir a euros, muestre el resultado y vuelva a
pedir una cantidad para volver a hacerla conversión. Si se introduce un cero el
programa debe parar. El programa debe devolver la cantidad en euros si es
positivo, el mensaje de advertencia si es negativo y volver a pedir introducir la
información tras la operación. Cuando se introduce un cero la ejecución del
programa debe finalizar.**/
public class Ejercicio_16 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int respuesta=1;
        while (respuesta!=0){
            System.out.println("Dime la cantidas de pesetas");
            int pesetas = scanner.nextInt();
            if (pesetas<0){
                System.out.println("Has introducido un numero menor a cero");
            }else{
                System.out.println("La cantidad en euros es "+Math.round(pesetas/166.386));
            }
            System.out.println("¿Quieres pasar otra cantidad a euros? (Cualquier numero-SI 0-NO)");
            respuesta= scanner.nextInt();
        }
    }
}
