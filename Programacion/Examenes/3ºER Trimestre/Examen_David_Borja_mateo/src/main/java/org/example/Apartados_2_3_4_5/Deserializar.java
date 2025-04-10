package org.example.Apartados_2_3_4_5;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.example.Apartado_1.Autor;
import org.example.Apartado_1.Libro;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import java.io.*;
import java.util.ArrayList;

public class Deserializar {
    ArrayList<Autor> autores=new ArrayList<>();
    ArrayList<Libro> libros=new ArrayList<>();

    public Deserializar() {
    }

    public ArrayList<Libro> getLibros() {
        return libros;
    }

    public ArrayList<Autor> getAutores() {
        return autores;
    }

    public void Deserializar_Autor(File archivoxml){
        //leo el archivo
        try(BufferedReader bufferedReader=new BufferedReader(new FileReader(archivoxml))){
            String linea;
            //compruebo que la liena no esta vacia
            while ((linea= bufferedReader.readLine())!=null){
                //leo el valor de la linea
                StringReader objeto=new StringReader(linea);
                JAXBContext jaxbContext=JAXBContext.newInstance(Autor.class);
                Unmarshaller unmarshaller= jaxbContext.createUnmarshaller();
                //deserializo y añado a la lista
                Autor autor=(Autor) unmarshaller.unmarshal(objeto);
                autores.add(autor);
            }
        } catch (IOException | JAXBException e) {
            throw new RuntimeException(e);
        }
    }
    public void Deserializar_Libro(File archivojson){
        //Objectmapper para poder deserializar
        ObjectMapper objectMapper=new ObjectMapper();
        //leo con un bufferedreader
        try (BufferedReader bufferedReader=new BufferedReader(new FileReader(archivojson))){
            String linea;
            while ((linea= bufferedReader.readLine())!=null){
                //deserializo el valor y lo meto a una lista
                Libro libro=objectMapper.readValue(linea, Libro.class);
                libros.add(libro);
            }

        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

}
