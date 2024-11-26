package Ejercicio_1;

import java.time.LocalDate;

public class DemoPersonas {
    public static void main(String[] args) {
        Personas grupo=new Personas();
        Persona p1=new Persona("Lucia","andres", LocalDate.parse("2004-11-27"),"56789654D",'M');
        Persona p2=new Persona("Jose");
        Persona p3=new Persona("Julia","Suarez",LocalDate.parse("2002-12-12"),"45678907J",'M');
        p1.saludar();
        System.out.println(p1.edad());
        grupo.getPersonasLista().add(p2);
        Persona p4=new Persona("Antonio","Rodriguez", LocalDate.parse("2003-11-12"),"55678909I",'H');
        grupo.getPersonasLista().add(p4);
        grupo.getPersonasLista().add(p3);
        grupo.Mostrarpersonas();
        System.out.println(grupo.calcularEdadMedia());
        System.out.println(grupo.PersonaMasEdad());
    }
}
