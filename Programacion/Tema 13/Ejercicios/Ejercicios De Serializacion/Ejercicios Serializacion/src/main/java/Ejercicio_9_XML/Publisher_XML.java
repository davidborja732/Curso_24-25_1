package Ejercicio_9_XML;


import Ejercicio_9_JSON.Book_EJ9;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;

import java.util.ArrayList;
import java.util.List;
@XmlRootElement
public class Publisher_XML {
    private String name;
    private String address;
    private List<String> libros=new ArrayList<>();

    public Publisher_XML(String name, String address) {
        this.name = name;
        this.address = address;
    }

    public Publisher_XML() {
    }
    @XmlElement
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    @XmlElement
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    @XmlElement
    public List<String> getLibros() {
        return libros;
    }

    public void setLibros(List<String> libros) {
        this.libros = libros;
    }
    public void add(Book_EJ9_XML libro){
        libros.add(libro.getTitulo());
    }
}
