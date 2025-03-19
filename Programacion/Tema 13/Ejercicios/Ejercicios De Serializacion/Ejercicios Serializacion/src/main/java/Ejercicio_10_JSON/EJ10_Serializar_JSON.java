package Ejercicio_10_JSON;
import Ejercicio_7_JSON.Book_EJ7;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

public class EJ10_Serializar_JSON {
    public static void main(String[] args) throws IOException {
        File file=new File("FIcheros/EJ10.json");
        LibraryCatalog libreria=new LibraryCatalog();
        ArrayList<Book_EJ7> lista=new ArrayList<>();
        Author_EJ10 author=new Author_EJ10("William Shakespeare");
        Book_EJ7 libro1 = new Book_EJ7("Romeo y Julieta", 1597);
        Book_EJ7 libro2 = new Book_EJ7("Hamlet", 1603);
        Book_EJ7 libro3 = new Book_EJ7("Macbeth", 1623);
        lista.add(libro2);
        lista.add(libro1);
        lista.add(libro3);
        ObjectMapper objectMapper=new ObjectMapper();
        try (BufferedWriter bufferedWriter=new BufferedWriter(new FileWriter(file))){
            for (Book_EJ7 book:lista) {
                libreria.add(author,book);
                //System.out.println(book);
                String json = objectMapper.writeValueAsString(libreria);
                System.out.println(json);
            }
            //for (Map.Entry(String,String) )


        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
