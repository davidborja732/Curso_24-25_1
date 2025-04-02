package Ejercicio_2.Deserializar;

import Ejercicio_2.Lista_productos;
import Ejercicio_2.Productos;
import jakarta.xml.bind.JAXBContext;
import jakarta.xml.bind.JAXBException;
import jakarta.xml.bind.Unmarshaller;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.ArrayList;

public class Ej2_XML {
    public static void main(String[] args) {
        try {
            JAXBContext context = JAXBContext.newInstance(Lista_productos.class);
            Unmarshaller unmarshaller = context.createUnmarshaller();
            Lista_productos deserializada=(Lista_productos) unmarshaller.unmarshal(new FileReader("Archivos/EJ2.xml"));
            for (Productos productos: deserializada.getProductos()){
                System.out.println(productos.getId());
            }
        } catch (JAXBException e) {
            throw new RuntimeException(e);
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
