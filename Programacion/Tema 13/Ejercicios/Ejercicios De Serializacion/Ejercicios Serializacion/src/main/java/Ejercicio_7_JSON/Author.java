package Ejercicio_7_JSON;

import java.util.ArrayList;
import java.util.List;

public class Author {
    private String name;
    private List<Book_EJ7> booksauthor=new ArrayList<>();

    public Author(String name) {
        this.name = name;
    }

    public Author() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Book_EJ7> getBooksauthor() {
        return booksauthor;
    }

    public void setBooksauthor(List<Book_EJ7> booksauthor) {
        this.booksauthor = booksauthor;
    }
    public void add(Book_EJ7 libro){
        booksauthor.add(libro);
    }
}
