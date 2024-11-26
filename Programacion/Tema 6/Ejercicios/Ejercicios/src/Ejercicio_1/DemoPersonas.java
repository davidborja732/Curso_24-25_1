package Ejercicio_1;

import java.time.LocalDate;

public class DemoPersonas {
    public static void main(String[] args) {
        Personas grupo=new Personas();
        Persona p1=new Persona("juan","andres", LocalDate.parse("2004-12-12"),"56789654D",'M');
        Persona p2=new Persona("Jose");
        p1.saludar();
        p1.edad();
        System.out.println(p1.toString());
        grupo.getPersonas().add(p1);
        grupo.getPersonas().add(p2);
        Persona p3=new Persona("Antonio","Rodriguez", LocalDate.parse("2003-11-12"),"5567890I",'H');
        grupo.getPersonas().add(p3);
        System.out.println(grupo.toString());
        System.out.println(grupo.calcularEdadMedia());
        System.out.println(grupo.getPersonaMasEdad());
    }
}
