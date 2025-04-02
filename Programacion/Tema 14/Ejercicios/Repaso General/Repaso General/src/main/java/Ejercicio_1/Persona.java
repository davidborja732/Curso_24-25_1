package Ejercicio_1;

import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;
@XmlRootElement
public class Persona {
    private String nombre;
    private int edad;
    private String correo;

    public Persona(String correo, int edad, String nombre) {
        this.correo = correo;
        this.edad = edad;
        this.nombre = nombre;
    }

    public Persona() {
    }
    @XmlElement
    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }
    @XmlElement
    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }
    @XmlElement
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
