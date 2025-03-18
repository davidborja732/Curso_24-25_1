package Ejercicio_8_JSON;

import Ejercicio_1.Book;
import Ejercicio_7_JSON.Author;
import Ejercicio_7_JSON.Book_EJ7;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.BufferedWriter;
import java.io.FileWriter;

public class Ejercicio_8_serializar {
    public static void main(String[] args) {
        Bookstore tienda1 = new Bookstore();
        Author autor = new Author("Gabriel García Márquez");

        Book_EJ7 libro1 = new Book_EJ7("Cien años de soledad", 1967);
        Book_EJ7 libro2 = new Book_EJ7("El amor en los tiempos del cólera", 1985);
        Book_EJ7 libro3 = new Book_EJ7("Crónica de una muerte anunciada", 1981);
        autor.getBooksauthor().add(libro1);
        autor.getBooksauthor().add(libro2);
        autor.getBooksauthor().add(libro3);
        Book libro4 = new Book("Matar a un ruiseñor", 1960, "Harper Lee");
        Book libro5 = new Book("La isla del tesoro", 1883, "Robert Louis Stevenson");
        Book libro6 = new Book("Fahrenheit 451", 1953, "Ray Bradbury");
        tienda1.add_libro(libro4);
        tienda1.add_libro(libro5);
        tienda1.add_libro(libro6);
        tienda1.add_autor(autor);
        ObjectMapper objectMapper=new ObjectMapper();
        try (BufferedWriter bufferedWriter=new BufferedWriter(new FileWriter("FIcheros/EJ8.json"))){
            String json= objectMapper.writeValueAsString(tienda1);
            bufferedWriter.write(json);
            bufferedWriter.newLine();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
