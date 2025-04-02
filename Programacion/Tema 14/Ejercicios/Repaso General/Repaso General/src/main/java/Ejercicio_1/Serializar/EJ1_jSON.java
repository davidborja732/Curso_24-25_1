package Ejercicio_1.Serializar;

import Ejercicio_1.Persona;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.BufferedWriter;

import java.io.FileWriter;
import java.io.IOException;

public class EJ1_jSON {
    public static void main(String[] args) {
        Persona persona = new Persona("Juan@gmail.com",20,"Juan");
        ObjectMapper objectMapper=new ObjectMapper();
        try (BufferedWriter bufferedWriter=new BufferedWriter(new FileWriter("Archivos/EJ1.json"))){
            String json= objectMapper.writeValueAsString(persona);
            bufferedWriter.write(json);
            bufferedWriter.newLine();
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
