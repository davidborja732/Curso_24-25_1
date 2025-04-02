package Ejercicio_2.Serializar;

import Ejercicio_2.Productos;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

public class EJ2_JSON {
    public static void main(String[] args) {
        ArrayList<Productos> productos=new ArrayList<>();
        Productos producto=new Productos(1,"Chubasquero para peces",20);
        Productos producto2 = new Productos(2, "Sombrero acuático", 15);
        Productos producto3 = new Productos(3, "Gafas de sol para peces", 10);
        Productos producto4 = new Productos(4, "Zapatos impermeables para gatos", 25);
        Productos producto5 = new Productos(5, "Paraguas portátil para tortugas", 30);
        Productos producto6 = new Productos(6, "Chaleco salvavidas para patos", 35);
        Productos producto7 = new Productos(7, "Bufanda térmica para pingüinos", 20);
        productos.add(producto);
        productos.add(producto2);
        productos.add(producto3);
        productos.add(producto4);
        productos.add(producto5);
        productos.add(producto6);
        productos.add(producto7);
        ObjectMapper objectMapper=new ObjectMapper();
        for (Productos produc:productos){
            try (BufferedWriter bufferedWriter=new BufferedWriter(new FileWriter("Archivos/EJ2.json",true))){
                String json= objectMapper.writeValueAsString(produc);
                bufferedWriter.write(json);
                bufferedWriter.newLine();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
