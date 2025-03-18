package Ejercicio_5;

import jakarta.xml.bind.JAXBContext;
import jakarta.xml.bind.JAXBException;
import jakarta.xml.bind.Unmarshaller;

import java.io.FileNotFoundException;
import java.io.FileReader;

public class prueba_deserializar {
    public static void main(String[] args) {
        try {
            JAXBContext context=JAXBContext.newInstance(Book_1.class);
            Unmarshaller unmarshaller= context.createUnmarshaller();
            Book_1 libro = (Book_1) unmarshaller.unmarshal(new FileReader("FIcheros/ejercicio5.xml"));
            System.out.println(libro.toString());
        } catch (JAXBException e) {
            throw new RuntimeException(e);
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
