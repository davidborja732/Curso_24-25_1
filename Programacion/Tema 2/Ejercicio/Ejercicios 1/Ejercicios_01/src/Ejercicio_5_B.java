import java.util.Scanner;

public class Ejercicio_5_B {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.println("Dime el numero");
        int numero1= scanner.nextInt();
        double numero= (int) (Math.random()*numero1)+1;
        double numero4= (int) (Math.random()*numero1)+1;
        double numero5= (int) (Math.random()*numero1)+1;
        System.out.println(numero+" "+numero5+"  "+numero4);
    }
}
