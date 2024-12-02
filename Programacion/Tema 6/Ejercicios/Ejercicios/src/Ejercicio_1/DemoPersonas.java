package Ejercicio_1;

import java.time.LocalDate;

public class DemoPersonas {
    public static void main(String[] args) {
        Personas grupo=new Personas();
        Persona p1=new Persona("Antonia",LocalDate.parse("2000-09-12"));
        Persona p2=new Persona("Jose");
        Persona p3=new Persona();
        Persona p5=new Persona("Pepe",LocalDate.parse("2001-03-06"));
        System.out.println(p1.toString());
        grupo.getPersonasLista().add(p5);
        grupo.getPersonasLista().add(p3);
        p1.saludar();
        System.out.println(p1.edad());
        grupo.getPersonasLista().add(p2);
        Persona p4=new Persona();
        grupo.getPersonasLista().add(p4);
        grupo.Mostrarpersonas();
        System.out.println(grupo.calcularEdadMedia());
        System.out.println(grupo.PersonaMasEdad());
    }
}
