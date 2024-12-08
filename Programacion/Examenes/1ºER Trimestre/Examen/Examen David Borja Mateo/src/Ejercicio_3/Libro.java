package Ejercicio_3;

import java.time.LocalDate;
import java.time.Period;

public class Libro {
    private String Titulo;
    private String Autor;
    private LocalDate Fecha_publicacion;
    private String ISBN;
    private  String Genero;
    private double Precio;

    public Libro() {
    }

    public Libro(String titulo, String autor, String ISBN, LocalDate fecha_publicacion, String genero, double precio) {
        Titulo = titulo;
        Autor = autor;
        this.ISBN = ISBN;
        Fecha_publicacion = fecha_publicacion;
        Genero = genero;
        Precio = precio;
    }

    public Libro(String titulo, String autor) {
        Titulo = titulo;
        Autor = autor;
    }

    public Libro(String titulo) {
        Titulo = titulo;
    }

    public String getTitulo() {
        return Titulo;
    }

    public void setTitulo(String titulo) {
        Titulo = titulo;
    }

    public double getPrecio() {
        return Precio;
    }

    public void setPrecio(double precio) {
        Precio = precio;
    }

    public String getGenero() {
        return Genero;
    }

    public void setGenero(String genero) {
        Genero = genero;
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public LocalDate getFecha_publicacion() {
        return Fecha_publicacion;
    }

    public void setFecha_publicacion(LocalDate fecha_publicacion) {
        Fecha_publicacion = fecha_publicacion;
    }

    public String getAutor() {
        return Autor;
    }

    public void setAutor(String autor) {
        Autor = autor;
    }

    public String resumen() {
        return "El Libro " +Titulo+", escrito por "+Autor+ ", pertenece al genero "+Genero;
    }

    @Override
    public String toString() {
        return "Libro{" +
                "Titulo='" + Titulo + '\'' +
                ", Autor='" + Autor + '\'' +
                ", Fecha_publicacion=" + Fecha_publicacion +
                ", ISBN='" + ISBN + '\'' +
                ", Genero='" + Genero + '\'' +
                ", Precio=" + Precio +
                '}';
    }
    public int calculo_edad(){
        int antiguedad = 0;
        //compruebo que el libro tiene fecha de publicacion
        if (this.Fecha_publicacion!=null){
            //calculo el periodo entre la fecha de publicacion y la fecha actual
            antiguedad= Period.between(this.Fecha_publicacion,LocalDate.now()).getYears();
        }
        //devuelvo la antiguedad
        return antiguedad;
    }

}
