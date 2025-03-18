package Ejercicio_10_XML;

import Ejercicio_7_XML.Book_EJ7_XML;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;

import java.util.ArrayList;
import java.util.List;
@XmlRootElement
public class Author_EJ10_XML {
    private String name;
    private List<String> booksauthor=new ArrayList<>();

    public Author_EJ10_XML(String name) {
        this.name = name;
    }

    public Author_EJ10_XML() {
    }
    @XmlElement
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    @XmlElement
    public List<String> getBooksauthor() {
        return booksauthor;
    }

    public void setBooksauthor(List<String> booksauthor) {
        this.booksauthor = booksauthor;
    }
    public void add(Book_EJ7_XML libro){
        booksauthor.add(String.valueOf(libro.getTitulo()));
    }
}
