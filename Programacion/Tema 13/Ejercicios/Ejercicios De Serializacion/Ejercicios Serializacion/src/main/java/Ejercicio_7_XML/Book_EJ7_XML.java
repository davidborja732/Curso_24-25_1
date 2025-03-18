package Ejercicio_7_XML;

import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "book")
public class Book_EJ7_XML {
    private String titulo;
    private int año_publicacion;

    public Book_EJ7_XML() {
    }

    public Book_EJ7_XML(String titulo, int año_publicacion) {
        this.titulo = titulo;
        this.año_publicacion = año_publicacion;
    }
    @XmlElement
    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }
    @XmlElement
    public int getAño_publicacion() {
        return año_publicacion;
    }

    public void setAño_publicacion(int año_publicacion) {
        this.año_publicacion = año_publicacion;
    }

    @Override
    public String toString() {
        return "Book_EJ7{" +
                "titulo='" + titulo + '\'' +
                ", año_publicacion=" + año_publicacion +
                '}';
    }
}
