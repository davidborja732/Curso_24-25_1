package Ejercicio_5;

import jakarta.xml.bind.JAXBContext;
import jakarta.xml.bind.Marshaller;

import java.io.File;

public class prueba_serializar {
    public static void main(String[] args) {
        File file = new File("FIcheros/ejercicio5.xml");
        Book_1 libro1= new Book_1();
        libro1.setAutor("Harry Potter");
        libro1.setTitulo("JK Rowling");
        libro1.setPublicacion(1998);
        try {
            JAXBContext context = JAXBContext.newInstance(Book_1.class);
            Marshaller marshaller = context.createMarshaller();
            marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
            marshaller.marshal(libro1,file);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

