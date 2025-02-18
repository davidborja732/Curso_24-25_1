package Ejercicio_2;

public class Empleado_Fijo extends Empleado{
    public Empleado_Fijo(String nombre, int salario) {
        super(nombre, salario);
    }

    public Empleado_Fijo() {
    }

    @Override
    public int calcular_salario() {
        return salario;
    }
}
