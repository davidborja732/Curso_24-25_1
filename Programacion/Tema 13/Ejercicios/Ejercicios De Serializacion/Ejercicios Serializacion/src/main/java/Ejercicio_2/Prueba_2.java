package Ejercicio_2;

import
        Ejercicio_1.Book;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.BufferedReader;
import java.io.*;

public class Prueba_2 {
    public static void main(String[] args) {
        ObjectMapper objectMapper=new ObjectMapper();
        try(BufferedReader bufferedReader= new BufferedReader(new FileReader("FIcheros/libros.json"))){
            String linea;
            while ((linea= bufferedReader.readLine())!=null){
                Book libro=objectMapper.readValue(linea, Book.class);
                System.out.println(libro.toString());
            }
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
