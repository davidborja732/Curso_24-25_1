package Ejercicio_10_JSON;

import Ejercicio_7_JSON.Book_EJ7;

import java.util.HashMap;
import java.util.List;

public class LibraryCatalog {
     public HashMap<String,String> listaMap=new HashMap<>();

    public HashMap<String, String> getListaMap() {
        return listaMap;
    }

    public void setListaMap(HashMap<String, String> listaMap) {
        this.listaMap = listaMap;
    }

    public LibraryCatalog() {

    }
    public void add(Author_EJ10 autor, Book_EJ7 libro){
        listaMap.putIfAbsent(String.valueOf(autor.getName()),String.valueOf(libro.getTitulo()));
    }
}
