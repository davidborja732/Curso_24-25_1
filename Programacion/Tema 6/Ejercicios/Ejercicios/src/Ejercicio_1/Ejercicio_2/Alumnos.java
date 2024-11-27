package Ejercicio_1.Ejercicio_2;
import Ejercicio_1.Persona;

import java.time.LocalDate;
import java.util.ArrayList;

public class Alumnos extends Persona {
    private int curso;
    private String grupo;
    private ArrayList<String> asignaturas=new ArrayList<>();

    public Alumnos() {
        super();
    }

    public Alumnos(String nombre, int curso, String grupo, ArrayList<String> asignaturas) {
        super(nombre);
        this.curso = curso;
        this.grupo = grupo;
        this.asignaturas = asignaturas;
    }

    public Alumnos(String nombre, String apellidos, LocalDate fecha_nac, String dni, char sexo, int curso, String grupo, ArrayList<String> asignaturas) {
        super();
        this.curso = curso;
        this.grupo = grupo;
        this.asignaturas = asignaturas;
    }

    public Alumnos(String nombre, LocalDate fecha_nac, int curso, String grupo, ArrayList<String> asignaturas) {
        super(nombre, fecha_nac);
        this.curso = curso;
        this.grupo = grupo;
        this.asignaturas = asignaturas;
    }

    @Override
    public String toString() {
        return "Alumnos{" +
                "curso=" + curso +
                ", grupo='" + grupo + '\'' +
                ", asignaturas=" + asignaturas +
                '}';
    }

    public int getCurso() {
        return curso;
    }

    public void setCurso(int curso) {
        this.curso = curso;
    }

    public String getGrupo() {
        return grupo;
    }

    public void setGrupo(String grupo) {
        this.grupo = grupo;
    }

    public ArrayList<String> getAsignaturas() {
        return asignaturas;
    }

    public void setAsignaturas(ArrayList<String> asignaturas) {
        this.asignaturas = asignaturas;
    }

    public Alumnos(String nombre) {
        super(nombre);
    }

    public Alumnos(String nombre, LocalDate fecha_nac) {
        super(nombre, fecha_nac);
    }

    public Alumnos(String nombre, String apellidos, LocalDate fecha_nac, String dni, char sexo) {
        super();
    }

}
