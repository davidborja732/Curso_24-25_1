package Ejercicio_9_XML;

import Ejercicio_8_XML.Bookstore_XML;
import Ejercicio_9_JSON.Book_EJ9;
import Ejercicio_9_JSON.Publisher;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.xml.bind.JAXBContext;
import jakarta.xml.bind.Marshaller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;

public class EJ9_Serializar_XML {
    public static void main(String[] args) {
        File file=new File("FIcheros/EJ9XML.xml");
        ArrayList<Book_EJ9_XML> listalibros=new ArrayList<>();
        Publisher_XML publisher=new Publisher_XML("Santillana","Calle 3 Barcelona");
        Book_EJ9_XML libro1 = new Book_EJ9_XML("El extranjero", 1942, "Albert Camus");
        Book_EJ9_XML libro2 = new Book_EJ9_XML("La sombra del viento", 2001, "Carlos Ruiz Zafón");
        Book_EJ9_XML libro3 = new Book_EJ9_XML("El hombre invisible", 1897, "H.G. Wells");
        listalibros.add(libro1);
        listalibros.add(libro2);
        listalibros.add(libro3);
        for (Book_EJ9_XML libros:listalibros){
            String titulo=libros.getTitulo();
            publisher.getLibros().add(titulo);
        }
        try {
            JAXBContext context=JAXBContext.newInstance(Publisher_XML.class);
            Marshaller marshaller= context.createMarshaller();
            marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT,true);
            marshaller.marshal(publisher,file);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
