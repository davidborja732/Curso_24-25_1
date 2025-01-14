import java.time.LocalDate;
import java.time.Period;

public class Vehiculo {
    private String Marca;
    private String Modelo;
    private int Año_Fabricacion;
    private String Matricula;
    private double Precio;

    public Vehiculo(String marca, String modelo, int año_Fabricacion, String matricula, double precio) {
        Marca = marca;
        Modelo = modelo;
        Año_Fabricacion = año_Fabricacion;
        Matricula = matricula;
        Precio = precio;
    }

    public Vehiculo(String marca, String modelo) {
        Marca = marca;
        Modelo = modelo;
    }

    public Vehiculo(String matricula) {
        Matricula = matricula;
    }

    public Vehiculo() {
    }

    public String getMarca() {
        return Marca;
    }

    public void setMarca(String marca) {
        Marca = marca;
    }

    public String getModelo() {
        return Modelo;
    }

    public void setModelo(String modelo) {
        Modelo = modelo;
    }

    public int getAño_Fabricacion() {
        return Año_Fabricacion;
    }

    public void setAño_Fabricacion(int año_Fabricacion) {
        Año_Fabricacion = año_Fabricacion;
    }

    public String getMatricula() {
        return Matricula;
    }

    public void setMatricula(String matricula) {
        Matricula = matricula;
    }

    public double getPrecio() {
        return Precio;
    }

    public void setPrecio(double precio) {
        Precio = precio;
    }

    public String descripcion() {
        return "Vehiculo " +
                "Marca " + Marca +
                ", Modelo " + Modelo +
                ", Año_Fabricacion " + Año_Fabricacion +
                ", Matricula " + Matricula +
                ", Precio " + Precio +
                ".";
    }
    public int calcularAntiguedad(){
        return LocalDate.now().getYear()-Año_Fabricacion;
    }
}
