package Ejercicio_2.Serializar;

import Ejercicio_2.Lista_productos;
import Ejercicio_2.Productos;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.xml.bind.JAXBContext;
import jakarta.xml.bind.JAXBException;
import jakarta.xml.bind.Marshaller;

import java.io.*;
import java.lang.reflect.Array;
import java.util.ArrayList;

public class Ej2_XML {
    public static void main(String[] args) {
        Lista_productos listaProductos=new Lista_productos();
        Productos producto=new Productos(1,"Chubasquero para peces",20);
        Productos producto2 = new Productos(2, "Sombrero acuático", 15);
        Productos producto3 = new Productos(3, "Gafas de sol para peces", 10);
        Productos producto4 = new Productos(4, "Zapatos impermeables para gatos", 25);
        Productos producto5 = new Productos(5, "Paraguas portátil para tortugas", 30);
        Productos producto6 = new Productos(6, "Chaleco salvavidas para patos", 35);
        Productos producto7 = new Productos(7, "Bufanda térmica para pingüinos", 20);
        listaProductos.add(producto);
        listaProductos.add(producto2);
        listaProductos.add(producto3);
        listaProductos.add(producto4);
        listaProductos.add(producto5);
        listaProductos.add(producto6);
        listaProductos.add(producto7);
        try {
            JAXBContext context=JAXBContext.newInstance(Lista_productos.class);
            Marshaller marshaller= context.createMarshaller();
            marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT,true);
            marshaller.marshal(listaProductos,new File("Archivos/EJ2.xml"));
        } catch (JAXBException e) {
            throw new RuntimeException(e);
        }

    }
}
