import java.time.LocalDate;
import java.time.Period;

public class Empleado {
    private String Nombre;
    private String Apellidos;
    private LocalDate Fecha_contratacion;
    private String Dni;
    private double Salario;
    private String Puesto;

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String nombre) {
        this.Nombre = nombre;
    }

    public String getApellidos() {
        return Apellidos;
    }

    public void setApellidos(String apellidos) {
        this.Apellidos = apellidos;
    }

    public LocalDate getFecha_contratacion() {
        return Fecha_contratacion;
    }

    public void setFecha_contratacion(LocalDate fecha_contratacion) {
        this.Fecha_contratacion = fecha_contratacion;
    }

    public String getDni() {
        return Dni;
    }

    public void setDni(String dni) {
        this.Dni = dni;
    }

    public double getSalario() {
        return Salario;
    }

    public void setSalario(double salario) {
        this.Salario = salario;
    }

    public String getPuesto() {
        return Puesto;
    }

    public void setPuesto(String puesto) {
        this.Puesto = puesto;
    }

    public Empleado(String nombre) {
        this.Nombre = nombre;
    }

    public Empleado(String nombre, LocalDate fecha_contratacion) {
        this.Nombre = nombre;
        this.Fecha_contratacion = fecha_contratacion;
    }

    public Empleado(String nombre, String puesto, double salario, String dni, LocalDate fecha_contratacion, String apellidos) {
        this.Nombre = nombre;
        this.Puesto = puesto;
        this.Salario = salario;
        this.Dni = dni;
        this.Fecha_contratacion = fecha_contratacion;
        this.Apellidos = apellidos;
    }

    @Override
    public String toString() {
        return "Mi Nombre es " + Nombre +
                ", me apellido es " + Apellidos +
                ", me contrataron el " + Fecha_contratacion +
                ", tengo el Dni " + Dni +
                ", mi Salario es " + Salario +
                ", mi Puesto en la empresa es " + Puesto;
    }

    public void trabajar() {
        System.out.println("Estoy trabajando como " + this.Puesto);
    }

    public int antigüedad() {
        int antiguo = Period.between(this.getFecha_contratacion(), LocalDate.now()).getYears();
        System.out.print("Antiguedad en la empresa ");
        return antiguo;
    }
}

