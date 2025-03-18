package Ejercicio_10_JSON;

import Ejercicio_7_JSON.Book_EJ7;
import Ejercicio_9_JSON.Book_EJ9;

import java.util.ArrayList;
import java.util.List;

public class Author_EJ10 {
    private String name;
    private List<String> booksauthor=new ArrayList<>();

    public Author_EJ10(String name) {
        this.name = name;
    }

    public Author_EJ10() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<String> getBooksauthor() {
        return booksauthor;
    }

    public void setBooksauthor(List<String> booksauthor) {
        this.booksauthor = booksauthor;
    }
    public void add(Book_EJ7 libro){
        booksauthor.add(String.valueOf(libro.getTitulo()));
    }
}
