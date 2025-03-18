package Ejercicio_3;

import Ejercicio_1.Book;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.*;

public class prueba_3 {
    public static void main(String[] args) {
        Library libreria = new Library();
        File file = new File("FIcheros/Ejercicio3.json");
        Book libro4 = new Book("El nombre del viento", 2007, "Patrick Rothfuss");
        Book libro5 = new Book("El alquimista", 1988, "Paulo Coelho");
        Book libro6 = new Book("Sapiens: De animales a dioses", 2011, "Yuval Noah Harari");
        libreria.add(libro4);
        libreria.add(libro5);
        libreria.add(libro6);
        ObjectMapper objectMapper = new ObjectMapper();
        try(BufferedWriter bufferedWriter=new BufferedWriter(new FileWriter(file))){
            for (Book libros: libreria.getListalibros()){
                String json= objectMapper.writeValueAsString(libros);
                bufferedWriter.write(json);
                bufferedWriter.newLine();
            }
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}



