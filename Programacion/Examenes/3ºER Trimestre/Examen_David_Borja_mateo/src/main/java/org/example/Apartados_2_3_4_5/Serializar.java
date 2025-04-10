package org.example.Apartados_2_3_4_5;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.example.Apartado_1.Autor;
import org.example.Apartado_1.Libro;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import java.io.*;

public class Serializar {
    public Serializar() {
    }

    public void serializar_libro(Libro libro){
        //Objectmapper para poder serializar
        ObjectMapper objectMapper=new ObjectMapper();
        //escribire en el fichero con un bufferedwriter
        try(BufferedWriter bufferedWriter=new BufferedWriter(new FileWriter("Ficheros/libros.json",true))){
            //valor a escribir
            String json= objectMapper.writeValueAsString(libro);
            //escribo y hgo salto de linea
            bufferedWriter.write(json);
            bufferedWriter.newLine();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    public void serializar_Autor(Autor autor){
        //escribire con un bufferedwriter
        try(BufferedWriter bufferedWriter=new BufferedWriter(new FileWriter("Ficheros/autores.xml",true))){
            //lo uso para escribir linea a linea el pbjeto de la clase autor
            StringWriter objeto=new StringWriter();
            //digo la clase a serializar
            JAXBContext jaxbContext=JAXBContext.newInstance(Autor.class);
            Marshaller marshaller= jaxbContext.createMarshaller();
            //serializo, lo escribo y hago salto de linea
            marshaller.marshal(autor,objeto);
            bufferedWriter.write(String.valueOf(objeto));
            bufferedWriter.newLine();
        } catch (IOException | JAXBException e) {
            throw new RuntimeException(e);
        }
    }
}
