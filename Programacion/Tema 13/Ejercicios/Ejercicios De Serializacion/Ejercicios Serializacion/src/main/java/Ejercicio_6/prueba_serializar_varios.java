package Ejercicio_6;

import Ejercicio_5.Book_1;
import jakarta.xml.bind.JAXBContext;
import jakarta.xml.bind.Marshaller;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class prueba_serializar_varios {
    public static void main(String[] args) throws IOException {
        //FileWriter file = new FileWriter("FIcheros/ejercicio6.xml",true);
        File file = new File("FIcheros/ejercicio6.xml");
        Library library=new Library();
        Book_1 libro4 = new Book_1("Patrick Rothfuss", 2007, "El nombre del viento");
        Book_1 libro5 = new Book_1("Paulo Coelho", 1988, "El alquimista");
        Book_1 libro6 = new Book_1("Yuval Noah ", 2011, "Sapiens: De animales a dioses");
        library.add(libro4);
        library.add(libro5);
        library.add(libro6);
            try{
                JAXBContext context = JAXBContext.newInstance(Library.class);
                Marshaller marshaller = context.createMarshaller();
                marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
                marshaller.marshal(library, file);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
    }
}
