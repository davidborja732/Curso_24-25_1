import java.util.Scanner;

public class Ejercicio_2 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Dime el dia");
        int dias = scanner.nextInt();
        switch (dias){
            case 1:
                System.out.println("Lunes= Musica");
                break;
            case 2:
                System.out.println("Martes= Natacion");
                break;
            case 3:
                System.out.println("Miercoles= Ingles");
                break;
            case 4:
                System.out.println("Jueves= Natacion");
                break;
            case 5:
                System.out.println("Viernes= Libre");
                break;
            case 6:
                System.out.println("Sabado= Deporte escolar");
                break;
            case 7:
                System.out.println("Domingo= Libre");
                break;
            default:
                System.out.println("Valor erroneo");
        }
    }
}
