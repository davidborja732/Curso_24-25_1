package Ejercicio_1.Deserializar;

import Ejercicio_1.Persona;
import jakarta.xml.bind.JAXBContext;
import jakarta.xml.bind.JAXBException;
import jakarta.xml.bind.Unmarshaller;

import java.io.FileNotFoundException;
import java.io.FileReader;

public class EJ1_XML_Des {
    public static void main(String[] args) {
        try {
            JAXBContext context=JAXBContext.newInstance(Persona.class);
            Unmarshaller unmarshaller= context.createUnmarshaller();
            Persona persona=(Persona) unmarshaller.unmarshal(new FileReader("Archivos/EJ1.xml"));
            System.out.println(persona.getCorreo());
        } catch (JAXBException e) {
            throw new RuntimeException(e);
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
