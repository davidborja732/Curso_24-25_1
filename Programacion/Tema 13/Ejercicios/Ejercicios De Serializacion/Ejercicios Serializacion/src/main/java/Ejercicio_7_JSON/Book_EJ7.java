package Ejercicio_7_JSON;

public class Book_EJ7 {
    private String titulo;
    private int año_publicacion;

    public Book_EJ7() {
    }

    public Book_EJ7(String titulo, int año_publicacion) {
        this.titulo = titulo;
        this.año_publicacion = año_publicacion;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
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
                ", año_publicacion=" + año_publicacion +
                '}';
    }
}
