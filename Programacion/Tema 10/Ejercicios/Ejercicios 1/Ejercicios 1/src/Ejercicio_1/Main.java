package Ejercicio_1;

public class Main {
    public static void main(String[] args) {
        Empleado empleado1=new Empleado("Juan",900);
        Gerente gerente1=new Gerente("Pepe",1965.50,120.00);
        System.out.println(empleado1.mostrarinfo());
        System.out.println(gerente1.mostrarinfo());
    }
}
