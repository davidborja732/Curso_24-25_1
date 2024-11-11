import java.util.Scanner;

public class Ejercicio_8 {
    static int MayorMenorEntero(int numero1,int numero2){
        int mayor;
        if (numero1>numero2){
            mayor=numero1;
        }else {
            mayor=numero2;
        }
        return mayor;
    }
    static double MayorMenorDecimal(double numero1,double numero2){
        double mayor;
        if (numero1>numero2){
            mayor=numero1;
        }else {
            mayor=numero2;
        }
        return mayor;
    }
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.println("Dime el numero ");
        int numeroEN1= scanner.nextInt();
        System.out.println("Dime el numero ");
        int numeroEN2= scanner.nextInt();
        System.out.println(MayorMenorEntero(numeroEN1,numeroEN2));
        System.out.println("Dime el numero ");
        double numeroDE1= scanner.nextDouble();
        System.out.println("Dime el numero ");
        double numeroDE2= scanner.nextDouble();
        System.out.println(MayorMenorDecimal(numeroDE1,numeroDE2));
    }
}
