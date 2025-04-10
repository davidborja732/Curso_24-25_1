package org.example.Apartado_1;

import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.time.LocalDate;

public class Libro {
    private int id;
    private String titulo;
    private String genero;
    private LocalDate fecha_publicacion;
    private double precio;

    public Libro(int id, double precio, LocalDate fecha_publicacion, String genero, String titulo) {
        this.id = id;
        this.precio = precio;
        this.fecha_publicacion = fecha_publicacion;
        this.genero = genero;
        this.titulo = titulo;
    }

    public Libro() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public LocalDate getFecha_publicacion() {
        return fecha_publicacion;
    }

    public void setFecha_publicacion(LocalDate fecha_publicacion) {
        this.fecha_publicacion = fecha_publicacion;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    @Override
    public String toString() {
        return "Libro{" +
                "id=" + id +
                ", titulo='" + titulo + '\'' +
                ", genero='" + genero + '\'' +
                ", fecha_publicacion=" + fecha_publicacion +
                ", precio=" + precio +
                '}';
    }

}
