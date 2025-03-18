package Ejercicio_8_JSON;

import Ejercicio_1.Book;
import Ejercicio_7_JSON.Author;
import Ejercicio_7_JSON.Book_EJ7;

import java.util.ArrayList;
import java.util.List;

public class Bookstore {
    private List<Book> listalibros=new ArrayList<>();
    private List<Author> listaautores=new ArrayList<>();

    public Bookstore() {
    }

    public List<Book> getListalibros() {
        return listalibros;
    }

    public void setListalibros(List<Book> listalibros) {
        this.listalibros = listalibros;
    }

    public List<Author> getListaautores() {
        return listaautores;
    }

    public void setListaautores(List<Author> listaautores) {
        this.listaautores = listaautores;
    }
    public void add_autor(Author author){
        listaautores.add(author);
    }
    public void add_libro(Book libro){
        listalibros.add(libro);
    }
}
