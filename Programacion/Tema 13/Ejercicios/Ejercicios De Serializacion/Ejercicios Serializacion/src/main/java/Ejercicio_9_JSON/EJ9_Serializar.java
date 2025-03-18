package Ejercicio_9_JSON;

import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.util.ArrayList;

public class EJ9_Serializar {
    public static void main(String[] args) {
        ArrayList<Book_EJ9> listalibros=new ArrayList<>();
        Publisher publisher=new Publisher("Santillana","Calle 3 Barcelona");
        Book_EJ9 libro1 = new Book_EJ9("El extranjero", 1942, "Albert Camus");
        Book_EJ9 libro2 = new Book_EJ9("La sombra del viento", 2001, "Carlos Ruiz Zafón");
        Book_EJ9 libro3 = new Book_EJ9("El hombre invisible", 1897, "H.G. Wells");
        listalibros.add(libro1);
        listalibros.add(libro2);
        listalibros.add(libro3);
        for (Book_EJ9 libros:listalibros){
            String titulo=libros.getTitulo();
            publisher.getLibros().add(titulo);
        }
        ObjectMapper objectMapper=new ObjectMapper();
        try (BufferedWriter bufferedWriter=new BufferedWriter(new FileWriter("FIcheros/EJ9.json"))){
            String json= objectMapper.writeValueAsString(publisher);
            bufferedWriter.write(json);
            bufferedWriter.newLine();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
