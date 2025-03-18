package Ejercicio_5;

import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "book")
public class Book_1 {
    private String autor;
    private int publicacion;
    private String titulo;

    @XmlElement
    public String getAutor() {
        return autor;
    }

    public Book_1() {
    }

    public Book_1(String autor, int publicacion, String titulo) {
        this.autor = autor;
        this.publicacion = publicacion;
        this.titulo = titulo;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    @XmlElement
    public int getPublicacion() {
        return publicacion;
    }

    public void setPublicacion(int publicacion) {
        this.publicacion = publicacion;
    }

    @XmlElement
    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    @Override
    public String toString() {
        return "Book_1{" +
                "autor='" + autor + '\'' +
                ", publicacion=" + publicacion +
                ", titulo='" + titulo + '\'' +
                '}';
    }
}
