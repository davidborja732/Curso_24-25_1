package Ejercicio_3;

import Ejercicio_1.Book;

import java.util.ArrayList;

public class Library {
    private ArrayList<Book> listalibros=new ArrayList<>();

    public ArrayList<Book> getListalibros() {
        return listalibros;
    }

    public void setListalibros(ArrayList<Book> listalibros) {
        this.listalibros = listalibros;
    }

    public Library() {
    }

    public void add(Book libro) {
        listalibros.add(libro);
    }
}
