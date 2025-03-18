package Ejercicio_7_JSON;

import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.BufferedWriter;
import java.io.FileWriter;

public class EJ7_Serializacion {
    public static void main(String[] args) {
        Author autor=new Author("Stephen King");
        Book_EJ7 libro1 = new Book_EJ7("It", 1986);
        Book_EJ7 libro2 = new Book_EJ7("The Shining", 1977);
        Book_EJ7 libro3 = new Book_EJ7("Misery", 1987);
        autor.getBooksauthor().add(libro1);
        autor.getBooksauthor().add(libro2);
        autor.getBooksauthor().add(libro3);
        ObjectMapper objectMapper=new ObjectMapper();
        try (BufferedWriter bufferedWriter=new BufferedWriter(new FileWriter("FIcheros/ejercicio_7.json"))){
            String json= objectMapper.writeValueAsString(autor);
            bufferedWriter.write(json);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
