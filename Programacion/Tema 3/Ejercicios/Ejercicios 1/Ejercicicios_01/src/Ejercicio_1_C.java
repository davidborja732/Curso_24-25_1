import java.util.Scanner;

public class Ejercicio_1_C {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Dime la cantidas de pesetas");
        int pesetas = scanner.nextInt();
        if (pesetas<0){
            System.out.println("Has introducido un numero menor a cero");
        }else {
            System.out.println("La cantidad en euros es "+Math.round(pesetas/166.386));
        }
    }
}
