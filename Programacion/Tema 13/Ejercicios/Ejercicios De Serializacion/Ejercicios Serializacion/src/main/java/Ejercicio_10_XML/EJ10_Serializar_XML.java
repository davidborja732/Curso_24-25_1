package Ejercicio_10_XML;
import Ejercicio_7_XML.Book_EJ7_XML;
import jakarta.xml.bind.JAXBContext;
import jakarta.xml.bind.Marshaller;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

public class EJ10_Serializar_XML {
    public static void main(String[] args) throws IOException {
        File file=new File("FIcheros/EJ10.xml");
        LibraryCatalog_XML libreria=new LibraryCatalog_XML();
        ArrayList<Book_EJ7_XML> lista=new ArrayList<>();
        Author_EJ10_XML author=new Author_EJ10_XML("William Shakespeare");
        Book_EJ7_XML libro1 = new Book_EJ7_XML("Romeo y Julieta", 1597);
        Book_EJ7_XML libro2 = new Book_EJ7_XML("Hamlet", 1603);
        Book_EJ7_XML libro3 = new Book_EJ7_XML("Macbeth", 1623);
        lista.add(libro1);
        lista.add(libro2);
        lista.add(libro3);
        for (Book_EJ7_XML book:lista){
            author.getBooksauthor().add(book.getTitulo());
        }
        try {
            for (String libro:author.getBooksauthor()) {
                libreria.add(author, libro);
                for (Map.Entry<String,String > libros:libreria.getlistaMAp().entrySet()){
                    JAXBContext context = JAXBContext.newInstance(LibraryCatalog_XML.class);
                    Marshaller marshaller = context.createMarshaller();
                    marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
                    marshaller.marshal(libreria, new FileWriter(file));
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
