package org.example;

import jakarta.xml.bind.JAXBContext;
import jakarta.xml.bind.JAXBException;
import jakarta.xml.bind.Unmarshaller;
import org.xml.sax.InputSource;

import java.io.*;

public class Deserializar_XML {
    public static void main(String[] args) {
        try (BufferedReader bufferedReader=new BufferedReader(new FileReader("Ficheros/Serializar.xml"))){
            JAXBContext jaxbContext=JAXBContext.newInstance(Alumno.class);
            Unmarshaller unmarshaller=jaxbContext.createUnmarshaller();
            String linea;
            while((linea=bufferedReader.readLine())!=null){
                Alumno alumno=(Alumno) unmarshaller.unmarshal(new StringReader(linea));
                System.out.println(alumno.getId());
            }
        } catch (JAXBException | FileNotFoundException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
