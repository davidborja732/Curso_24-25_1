package Ejercicio_1;

import java.util.Scanner;

public class Ejercicio_1_B {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Dime la cantidas de pesetas");
        int pesetas= scanner.nextInt();
        if (pesetas==0){
            System.out.println("Has introducido cero");
        }else {
            System.out.println("La cantidad en euros es "+Math.round(pesetas/166.386));
        }
    }
}
