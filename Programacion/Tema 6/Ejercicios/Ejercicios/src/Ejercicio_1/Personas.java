package Ejercicio_1;

import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;

public class Personas {
    private ArrayList<Persona> PersonasLista;

    public Personas() {
        this.PersonasLista = new ArrayList<>();
    }

    public Personas(ArrayList<Persona> personas) {
        this.PersonasLista = personas;
    }

    public ArrayList<Persona> getPersonasLista() {
        return PersonasLista;
    }

    public void setPersonasLista(ArrayList<Persona> personasLista) {
        this.PersonasLista = personasLista;
    }

    public double calcularEdadMedia() {
        if (PersonasLista.isEmpty()) {
            return 0.0;
        }
        int totalEdad = 0;
        for (Persona persona : PersonasLista) {
            if (persona.getFecha_nac() != null) {
                totalEdad += persona.edad();
            }
        }
        System.out.println("La edad media es ");
        return totalEdad / PersonasLista.size();
    }

    public Persona PersonaMasEdad() {
        if (PersonasLista.isEmpty()) {//si lista esta vacia devuelvo el null
            return null;
        }
        Persona personaMasEdad = null;//recogere a la persona con mas edad para luego mostrarla
        int mayorEdad = Integer.MIN_VALUE;//Numero minimo que puede representar Integer para poder hacer la comparacion
        for (Persona persona : PersonasLista) {//recorro la lista PersonasLista
            if (persona.getFecha_nac() != null) {//compruebo que la persona si que tiene una fecha de nacimiento
                int edad = Period.between(persona.getFecha_nac(), LocalDate.now()).getYears();//calculo la edad 
                if (edad > mayorEdad) {
                    mayorEdad = edad;
                    personaMasEdad = persona;
                }
            }
        }
        System.out.println("La persona de mas edad es: ");
        return personaMasEdad;
    }

    public void Mostrarpersonas() {
        for (Persona persona : PersonasLista) {
            System.out.println(persona);
        }
    }
    @Override
    public String toString() {
        return "PersonasLista{" +
                "PersonasLista=" + PersonasLista + "\n";
    }
}


