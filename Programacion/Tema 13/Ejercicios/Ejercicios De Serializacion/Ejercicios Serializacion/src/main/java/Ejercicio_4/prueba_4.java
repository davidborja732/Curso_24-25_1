package Ejercicio_4;

import Ejercicio_1.Book;
import Ejercicio_3.Library;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class prueba_4 {
    public static void main(String[] args) {
        Library libreria=new Library();
        ObjectMapper objectMapper=new ObjectMapper();
        try(BufferedReader bufferedReader=new BufferedReader(new FileReader("FIcheros/Ejercicio3.json"))){
            String linea;
            while ((linea= bufferedReader.readLine())!=null){
                Book libro= objectMapper.readValue(linea, Book.class);
                libreria.add(libro);
            }
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        for (Book libro:libreria.getListalibros()){
            System.out.println(libro.toString());
        }
    }
}
