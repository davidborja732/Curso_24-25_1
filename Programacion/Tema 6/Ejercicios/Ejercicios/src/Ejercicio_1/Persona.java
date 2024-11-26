package Ejercicio_1;

import java.time.LocalDate;
import java.time.Period;
import java.time.Year;
import java.util.Date;

public class Persona {
    private String nombre;
    private String Apellidos;
    private LocalDate fecha_nac;
    private String dni;
    private char sexo;

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return Apellidos;
    }

    public void setApellidos(String apellidos) {
        Apellidos = apellidos;
    }

    public LocalDate getFecha_nac() {
        return fecha_nac;
    }

    public void setFecha_nac(LocalDate fecha_nac) {
        this.fecha_nac = fecha_nac;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public char getSexo() {
        return sexo;
    }

    public void setSexo(char sexo) {
        this.sexo = sexo;
    }

    public Persona(String nombre) {
        this.nombre = nombre;
    }
    public Persona(String nombre,LocalDate fecha_nac) {
        this.nombre = nombre;
        this.fecha_nac=fecha_nac;
    }

    public Persona(String nombre, String apellidos, LocalDate fecha_nac, String dni, char sexo) {
        this.nombre = nombre;
        this.Apellidos = apellidos;
        this.fecha_nac = fecha_nac;
        this.dni = dni;
        this.sexo = sexo;
    }

    @Override
    public String toString() {
        return "Persona{" +
                "nombre='" + this.nombre +
                ", Apellidos='" + this.Apellidos +
                ", fecha_nac=" + this.fecha_nac +
                ", dni='" + this.dni +
                ", sexo=" + this.sexo +
                '}';
    }

    public void saludar(){
        System.out.println("hola soy "+ this.nombre);
    }
    public void edad(){
        int edad=LocalDate.now().getYear()-this.fecha_nac.getYear();
        System.out.println("Edad= "+edad);
    }
}
