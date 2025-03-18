package Ejercicio_6;

import Ejercicio_5.Book_1;

import java.util.ArrayList;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;
import java.util.List;

@XmlRootElement(name = "library")
public class Library {
    private List<Book_1> listalibros = new ArrayList<>();

    @XmlElement(name = "book")
    public List<Book_1> getListalibros() {
        return listalibros;
    }

    public void setListalibros(List<Book_1> listalibros) {
        this.listalibros = listalibros;
    }

    public void add(Book_1 libro) {
        listalibros.add(libro);
    }
}

