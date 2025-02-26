package Ejercicio_1;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.println("Elige el tipo de notificación: (1) Email, (2) SMS");
        int opcion=scanner.nextInt();
        scanner.nextLine();
        Notificacion notificacion = null;
        switch (opcion){
            case 1:
                System.out.println("Introduce la dirección de correo:");
                String direccionEmail = scanner.nextLine();
                notificacion = new NotificacionEmail(direccionEmail);
                break;
            case 2:
                System.out.println("Introduce el número de teléfono:");
                String numeroTelefono = scanner.nextLine();
                notificacion = new NotificacionSMS(numeroTelefono);
                break;
            default:
                System.out.println("Solo puedes elegir opcion 1 o 2");
        }
        System.out.println("Introduce el mensaje:");
        String mensaje = scanner.nextLine();
        System.out.println(notificacion.enviar(mensaje));
    }
}
