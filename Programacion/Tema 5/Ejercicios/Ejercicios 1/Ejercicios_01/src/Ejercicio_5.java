import java.util.Scanner;

public class Ejercicio_5 {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        int lista[]={(int) (Math.random()*100),(int) (Math.random()*100),(int) (Math.random()*100),(int) (Math.random()*100),(int) (Math.random()*100),(int) (Math.random()*100),(int) (Math.random()*100),(int) (Math.random()*100),(int) (Math.random()*100),(int) (Math.random()*100)};
        for (int i=0;i<lista.length-1;i++){
            System.out.print(lista[i]+" ");
        }
        while (true){
            System.out.println("Dime el numero a buscar ");
            int numero= scanner.nextInt();
            if (numero < 0){
                System.out.println("Saliendo...");
                break;
            }
            if (numero==lista[0]||numero==lista[1]||numero==lista[2]||numero==lista[3]||numero==lista[4]||numero==lista[5]||numero==lista[6]||numero==lista[7]||numero==lista[8]||numero==lista[9]){
                System.out.println("El numero esta ");
            }else {
                System.out.println("El numero no esta");
            }

        }
    }
}
