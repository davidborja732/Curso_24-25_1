package Ejercicio_7_XML;

import Ejercicio_7_JSON.Book_EJ7;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;

import java.util.ArrayList;
import java.util.List;
@XmlRootElement(name = "author")
public class Author_XML {
    private String name;
    private List<Book_EJ7_XML> booksauthor=new ArrayList<>();

    public Author_XML(String name) {
        this.name = name;
    }

    public Author_XML() {
    }
    @XmlElement
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    @XmlElement
    public List<Book_EJ7_XML> getBooksauthor() {
        return booksauthor;
    }

    public void setBooksauthor(List<Book_EJ7_XML> booksauthor) {
        this.booksauthor = booksauthor;
    }
    public void add(Book_EJ7_XML libro){
        booksauthor.add(libro);
    }
}
