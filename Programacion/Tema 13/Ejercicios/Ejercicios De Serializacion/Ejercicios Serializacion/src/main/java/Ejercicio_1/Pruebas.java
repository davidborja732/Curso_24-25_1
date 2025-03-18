package Ejercicio_1;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.*;
import java.util.ArrayList;

public class Pruebas {
    public static void main(String[] args) {
        File file = new File("FIcheros/libros.json");
        Book libro1 = new Book("Don Quijote de la Mancha", 1605, "Miguel de Cervantes");
        ObjectMapper objectMapper=new ObjectMapper();
        try (BufferedWriter bufferedWriter=new BufferedWriter(new FileWriter(file))){
            String json = objectMapper.writeValueAsString(libro1);
            bufferedWriter.write(json);
            bufferedWriter.newLine();
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }
}
