package Ejercicio_1;

import java.time.LocalDate;

public class DemoPersonas {
    public static void main(String[] args) {
        Persona p1=new Persona("juan","andres", LocalDate.parse("2004-12-12"),"56789654D",'M');
        p1.saludar();
        p1.edad();
        p1.getSexo();
    }
}
