import java.util.Scanner;

public class Ejercicio_23 {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.println("Dime la direccion del archivo ");
        String nombreCompleto = scanner.nextLine();

        int Barra = nombreCompleto.lastIndexOf('/');
        int Punto = nombreCompleto.lastIndexOf('.');

        String path = nombreCompleto.substring(0, Barra + 1);
        String nombreFichero = nombreCompleto.substring(Barra + 1, Punto);
        String extension = nombreCompleto.substring(Punto + 1);

        System.out.println("Path: " + path);
        System.out.println("Nombre del fichero: " + nombreFichero);
        System.out.println("Extensión: " + extension);
    }
}

