package Ejercicio_4;

import java.util.Locale;
import java.util.Scanner;

public class Interfaz {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        scanner.useLocale(Locale.ENGLISH); // Forzar el uso de punto como separador decimal
        Ticket ticket1 = new Ticket();

        System.out.println("Cuantos productos quiere introducir= ");
        int numero = scanner.nextInt();
        int contador = 0;
        while (contador < numero) {
            System.out.println("Dime el Nombre del producto");
            String nombre = scanner.next();
            System.out.println("Dime las unidades del producto");
            int unidades = scanner.nextInt();
            System.out.println("Dime el precio del producto");
            double precio = scanner.nextDouble();
            System.out.println("Dime el IVA del producto");
            double iva = scanner.nextDouble();
            Producto producto = new Producto(nombre, unidades, precio, iva);
            ticket1.getListaproductos().add(producto);
            contador++;
        }
        scanner.close();
        ticket1.Mostrar();
        System.out.println("El precio sin iva es " + ticket1.calcularprecioticketsiniva());
        System.out.println("El precio con iva es " + ticket1.calcularprecioticketconiva());
    }
}

