package Ejercicio_1.Serializar;

import Ejercicio_1.Persona;
import jakarta.xml.bind.JAXBContext;
import jakarta.xml.bind.JAXBException;
import jakarta.xml.bind.Marshaller;

import java.io.File;
import java.io.IOException;


public class EJ1_XML {
    public static void main(String[] args) {
        Persona persona=new Persona("Juan@gmail.com",20,"Juan");
        File file=new File("Archivos/EJ1.xml");
        if (!file.exists()){
            try {
                file.createNewFile();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
        try {
            JAXBContext context=JAXBContext.newInstance(Persona.class);
            Marshaller marshaller= context.createMarshaller();
            marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT,true);
            marshaller.marshal(persona,file);
        } catch (JAXBException e) {
            throw new RuntimeException(e);
        }
    }
}
