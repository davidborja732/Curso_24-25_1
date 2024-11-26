package Ejercicio_1;
import java.time.LocalDate;
import java.util.ArrayList;

public class Personas extends Persona{
    private ArrayList<Persona> personas=new ArrayList<>();

    public Personas(String nombre) {
        super(nombre);
    }

    public Personas(String nombre, LocalDate fecha_nac) {
        super(nombre, fecha_nac);
    }

    public Personas(String nombre, String apellidos, LocalDate fecha_nac, String dni, char sexo) {
        super(nombre, apellidos, fecha_nac, dni, sexo);
    }

    public ArrayList<Persona> getPersonas() {
        return personas;
    }

    public void setPersonas(ArrayList<Persona> personas) {
        this.personas = personas;
    }

    //public Personas(ArrayList<Persona> personas) {
        //this.personas = personas;
    //}

    @Override
    public String toString() {
        return "Personas{" +
                "personas=" + personas +
                '}';
    }
}
