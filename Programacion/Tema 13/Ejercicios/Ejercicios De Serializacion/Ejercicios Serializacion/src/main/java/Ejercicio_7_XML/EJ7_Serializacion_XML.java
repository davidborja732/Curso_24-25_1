package Ejercicio_7_XML;

import jakarta.xml.bind.JAXBContext;
import jakarta.xml.bind.JAXBException;
import jakarta.xml.bind.Marshaller;

import java.io.File;

public class EJ7_Serializacion_XML {
    public static void main(String[] args) {
        Author_XML autor=new Author_XML("Isabel Allende");
        Book_EJ7_XML libro1 = new Book_EJ7_XML("La casa de los espíritus", 1982);
        Book_EJ7_XML libro2 = new Book_EJ7_XML("Eva Luna", 1987);
        Book_EJ7_XML libro3 = new Book_EJ7_XML("Paula", 1994);
        autor.getBooksauthor().add(libro1);
        autor.getBooksauthor().add(libro2);
        autor.getBooksauthor().add(libro3);
        try {
            JAXBContext context=JAXBContext.newInstance(Author_XML.class);
            Marshaller marshaller= context.createMarshaller();
            marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT,true);
            marshaller.marshal(autor,new File("FIcheros/EJ7.xml"));
        } catch (JAXBException e) {
            throw new RuntimeException(e);
        }
    }
}
