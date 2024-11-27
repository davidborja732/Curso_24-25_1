package Ejercicio_1;

import java.time.LocalDate;
import java.time.Period;

public class Persona {
    private String nombre;
    private String apellidos;
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
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
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

    public Persona(String nombre, LocalDate fecha_nac) {
        this.nombre = nombre;
        this.fecha_nac = fecha_nac;
    }

    public Persona() {
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.fecha_nac = fecha_nac;
        this.dni = dni;
        this.sexo = sexo;
    }

    @Override
    public String toString() {
        return "Persona " +
                "nombre='" + nombre + '\'' +
                ", apellidos='" + apellidos + '\'' +
                ", fecha_nac=" + fecha_nac +
                ", dni='" + dni + '\'' +
                ", sexo=" + sexo;
    }

    public void saludar() {
        System.out.println("Hola, soy " + this.nombre);
    }

    public int edad() {
        int edad = Period.between(this.getFecha_nac(), LocalDate.now()).getYears();
        System.out.print("Edad= ");
        return edad;
    }
}

