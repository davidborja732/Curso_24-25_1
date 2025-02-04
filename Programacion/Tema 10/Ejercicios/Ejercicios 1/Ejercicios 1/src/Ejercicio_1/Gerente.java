package Ejercicio_1;

public class Gerente extends Empleado{
    private double bono;
    public Gerente(String nombre, double salario, double bono) {
        super(nombre, salario);
        this.bono = bono;
    }

    @Override
    public String mostrarinfo() {
        return super.mostrarinfo()+" bono "+bono;
    }
}
