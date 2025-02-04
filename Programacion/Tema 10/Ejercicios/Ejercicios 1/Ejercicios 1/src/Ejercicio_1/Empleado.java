package Ejercicio_1;

public class Empleado {
    private String nombre;
    private double salario;

    public Empleado(String nombre, double salario) {
        this.nombre = nombre;
        this.salario = salario;
    }
    public String mostrarinfo(){
        return "nombre "+nombre+" salario "+salario;
    }
}
