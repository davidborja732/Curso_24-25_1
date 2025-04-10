package org.example;

import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Objects;

public class Deserializar_JSON {
    public static void main(String[] args) {
        ArrayList<Alumno> alumnosdeserializados=new ArrayList<>();
        ObjectMapper objectMapper=new ObjectMapper();
        try (BufferedReader bufferedReader=new BufferedReader(new FileReader("Ficheros/Serializar.json"))){
            String linea;
            while (((linea= bufferedReader.readLine())!=null)){
                Alumno alumno=objectMapper.readValue(linea, Alumno.class);
                alumnosdeserializados.add(alumno);
            }
            for (Alumno alumnos:alumnosdeserializados){
                System.out.println(alumnos.toString());
            }
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
