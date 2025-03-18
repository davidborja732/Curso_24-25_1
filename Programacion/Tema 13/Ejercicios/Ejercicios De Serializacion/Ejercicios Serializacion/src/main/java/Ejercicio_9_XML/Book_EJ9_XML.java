package Ejercicio_9_XML;

import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Book_EJ9_XML {
    private String titulo;
    private String autor;
    private int año_publicacion;

    public Book_EJ9_XML(String titulo) {
        this.titulo = titulo;
    }

    public Book_EJ9_XML() {
    }

    public Book_EJ9_XML(String titulo, int año_publicacion, String autor) {
        this.titulo = titulo;
        this.año_publicacion = año_publicacion;
        this.autor = autor;
    }
    @XmlElement
    public String getTitulo() {
        return titulo;
    }


    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }
    @XmlElement
    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
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
                ", autor='" + autor + '\'' +
                ", año_publicacion=" + año_publicacion +
                '}';
    }
}
