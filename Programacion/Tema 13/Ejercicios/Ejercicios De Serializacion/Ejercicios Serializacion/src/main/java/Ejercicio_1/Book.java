package Ejercicio_1;

public class Book {
    private String titulo;
    private String autor;
    private int año_publicacion;

    public Book() {
    }

    public Book(String titulo, int año_publicacion, String autor) {
        this.titulo = titulo;
        this.año_publicacion = año_publicacion;
        this.autor = autor;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

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
