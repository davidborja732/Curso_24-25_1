package Ejercicio_8_XML;

import Ejercicio_1.Book;
import Ejercicio_5.Book_1;
import Ejercicio_7_XML.Author_XML;
import Ejercicio_7_XML.Book_EJ7_XML;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.xml.bind.JAXBContext;
import jakarta.xml.bind.Marshaller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;

public class Ejercicio_8_serializar_XML {
    public static void main(String[] args) {
        Bookstore_XML tienda1 = new Bookstore_XML();
        Author_XML autor = new Author_XML("Gabriel García Márquez");
        Book_EJ7_XML libro1 = new Book_EJ7_XML("Cien años de soledad", 1967);
        Book_EJ7_XML libro2 = new Book_EJ7_XML("El amor en los tiempos del cólera", 1985);
        Book_EJ7_XML libro3 = new Book_EJ7_XML("Crónica de una muerte anunciada", 1981);
        autor.getBooksauthor().add(libro1);
        autor.getBooksauthor().add(libro2);
        autor.getBooksauthor().add(libro3);
        Book_1 libro4 = new Book_1("Matar a un ruiseñor", 1960, "Harper Lee");
        Book_1 libro5 = new Book_1("La isla del tesoro", 1883, "Robert Louis Stevenson");
        Book_1 libro6 = new Book_1("Fahrenheit 451", 1953, "Ray Bradbury");
        tienda1.add_libro(libro4);
        tienda1.add_libro(libro5);
        tienda1.add_libro(libro6);
        tienda1.add_autor(autor);
        ObjectMapper objectMapper=new ObjectMapper();
        try{
            JAXBContext context=JAXBContext.newInstance(Bookstore_XML.class);
            Marshaller marshaller= context.createMarshaller();
            marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT,true);
            marshaller.marshal(tienda1,new File("FIcheros/tiendaEJ8.xml"));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
