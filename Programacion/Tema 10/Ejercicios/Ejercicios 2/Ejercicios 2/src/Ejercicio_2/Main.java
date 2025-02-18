package Ejercicio_2;

public class Main {
    public static void main(String[] args) {
        Empleado_Fijo empleado=new Empleado_Fijo("Juan",1560);
        EmpleadoPorHoras empleado2=new EmpleadoPorHoras("Luna",240,6);
        System.out.println(empleado.calcular_salario());
        System.out.println(empleado2.calcular_salario());
    }
}
