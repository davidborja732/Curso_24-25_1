package Ejercicio_1;

import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;

public class Personas {
    private ArrayList<Persona> personas;

    public Personas() {
        this.personas = new ArrayList<>();
    }

    public Personas(ArrayList<Persona> personas) {
        this.personas = personas;
    }

    public ArrayList<Persona> getPersonas() {
        return personas;
    }

    public void setPersonas(ArrayList<Persona> personas) {
        this.personas = personas;
    }

    public double calcularEdadMedia() {
        if (personas.isEmpty()) {
            return 0.0;
        }
        int totalEdad = 0;
        int contador = 0;
        for (Persona persona : personas) {
            if (persona.getFecha_nac() != null) {
                totalEdad += Period.between(persona.getFecha_nac(), LocalDate.now()).getYears();
                contador++;
            }
        }
        System.out.print("La edad media es ");
        return contador == 0 ? 0.0 : (double) totalEdad / contador;
    }
    public Persona getPersonaMasEdad() {
        if (personas.isEmpty()) {//si lista esta vacia devuelvo el null
            return null;
        }
        Persona personaMasEdad = null;//recogere a la persona con mas edad para luego mostrarla
        int mayorEdad = Integer.MIN_VALUE;//numero minimo que puede representar Integer para poder hacer la comparacion
        for (Persona persona : personas) {//recorro la lista personas
            if (persona.getFecha_nac() != null) {//compruebo que la persona si que tiene una fecha de nacimiento
                int edad = Period.between(persona.getFecha_nac(), LocalDate.now()).getYears();//calculo la edad 
                if (edad > mayorEdad) {
                    mayorEdad = edad;
                    personaMasEdad = persona;
                }
            }
        }
        return personaMasEdad;
    }
    @Override
    public String toString() {
        return "Personas{" +
                "personas=" + personas +
                '}';
    }
}


