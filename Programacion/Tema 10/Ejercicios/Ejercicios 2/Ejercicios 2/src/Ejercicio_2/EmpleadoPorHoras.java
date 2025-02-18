package Ejercicio_2;

public class EmpleadoPorHoras extends Empleado{
    public int horas_trabajadas;
    public int tarifa_hora;

    public EmpleadoPorHoras(String nombre, int horas_trabajadas, int tarifa_hora) {
        super(nombre);
        this.horas_trabajadas = horas_trabajadas;
        this.tarifa_hora = tarifa_hora;
    }

    public EmpleadoPorHoras(int horas_trabajadas, int tarifa_hora) {
        this.horas_trabajadas = horas_trabajadas;
        this.tarifa_hora = tarifa_hora;
    }

    public int getHoras_trabajadas() {
        return horas_trabajadas;
    }

    public void setHoras_trabajadas(int horas_trabajadas) {
        this.horas_trabajadas = horas_trabajadas;
    }

    public int getTarifa_hora() {
        return tarifa_hora;
    }

    public void setTarifa_hora(int tarifa_hora) {
        this.tarifa_hora = tarifa_hora;
    }

    @Override
    public int calcular_salario() {
        return horas_trabajadas*tarifa_hora;
    }
}
