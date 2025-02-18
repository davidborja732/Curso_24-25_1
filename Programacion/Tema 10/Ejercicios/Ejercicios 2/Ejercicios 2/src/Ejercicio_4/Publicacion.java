package Ejercicio_4;

public class Publicacion {
    private String titulo;
    private String autor;

    public Publicacion(String titulo, String autor) {
        this.titulo = titulo;
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
    public String mostrarinformacion(){
        return "El autor del libro "+titulo+" es "+autor;
    }
}
