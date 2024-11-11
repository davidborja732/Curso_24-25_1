import java.util.Scanner;

public class Ejercicio_11 {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.println("Dime precio ");
        int precio= scanner.nextInt();
        System.out.println("Dime superficie ");
        int superficie= scanner.nextInt();
        System.out.println("Dime si tiene garaje ");
        boolean garaje = Boolean.parseBoolean(scanner.next());
        boolean comprobar=(precio<150000)&&(superficie>80)&&(garaje==true);
        System.out.println("¿Me interesa? "+comprobar);
    }
}
