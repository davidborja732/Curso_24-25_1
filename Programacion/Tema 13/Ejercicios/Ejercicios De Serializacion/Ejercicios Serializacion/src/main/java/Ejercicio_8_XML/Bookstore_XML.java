package Ejercicio_8_XML;

import Ejercicio_1.Book;
import Ejercicio_5.Book_1;
import Ejercicio_7_JSON.Author;
import Ejercicio_7_XML.Author_XML;
import Ejercicio_7_XML.Book_EJ7_XML;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;

import java.util.ArrayList;
import java.util.List;
@XmlRootElement(name = "bookstore")
public class Bookstore_XML {
    private List<Book_1> listalibros=new ArrayList<>();
    private List<Author_XML> listaautores=new ArrayList<>();

    public Bookstore_XML() {
    }
    @XmlElement
    public List<Book_1> getListalibros() {
        return listalibros;
    }

    public void setListalibros(List<Book_1> listalibros) {
        this.listalibros = listalibros;
    }
    @XmlElement
    public List<Author_XML> getListaautores() {
        return listaautores;
    }

    public void setListaautores(List<Author_XML> listaautores) {
        this.listaautores = listaautores;
    }
    public void add_autor(Author_XML author){
        listaautores.add(author);
    }
    public void add_libro(Book_1 libro){
        listalibros.add(libro);
    }
}
