package Ejercicio_9_JSON;


import java.util.ArrayList;
import java.util.List;

public class Publisher {
    private String name;
    private String address;
    private List<String> libros=new ArrayList<>();

    public Publisher(String name, String address) {
        this.name = name;
        this.address = address;
    }

    public Publisher() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public List<String> getLibros() {
        return libros;
    }

    public void setLibros(List<String> libros) {
        this.libros = libros;
    }
    public void add(Book_EJ9 libro){
        libros.add(String.valueOf(libro.getTitulo()));
    }
}
