package Ejercicio_6;

import Ejercicio_5.Book_1;
import jakarta.xml.bind.JAXBContext;
import jakarta.xml.bind.Unmarshaller;
import java.io.File;

public class prueba_deserializar_varios {

    public static void main(String[] args) {
        File fileoriginal = new File("FIcheros/ejercicio6.xml");
        try {
            JAXBContext context = JAXBContext.newInstance(Library.class);
            Unmarshaller unmarshaller = context.createUnmarshaller();
            Library library=(Library) unmarshaller.unmarshal(fileoriginal);
            for (Book_1 libro1 : library.getListalibros()) {
                System.out.println(libro1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}



