package Ejercicio_1.Deserializar;

import Ejercicio_1.Persona;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class Ej1_JSON_Des {
    public static void main(String[] args) {
        ObjectMapper objectMapper=new ObjectMapper();
        try (BufferedReader bufferedReader=new BufferedReader(new FileReader("Archivos/EJ1.json"))){
            String linea;
            Persona persona = null;
            while ((linea= bufferedReader.readLine())!=null){
                persona=objectMapper.readValue(linea, Persona.class);
            }
            System.out.println(persona.getCorreo()+" "+persona.getNombre()+" "+persona.getEdad());
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
