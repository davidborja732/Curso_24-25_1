package Ejercicio_10_XML;

import Ejercicio_10_JSON.Author_EJ10;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;

import java.util.HashMap;
@XmlRootElement
public class LibraryCatalog_XML {
     private HashMap<String,String> listaMAp=new HashMap<>();
    @XmlElement
    public HashMap<String, String> getlistaMAp() {
        return listaMAp;
    }

    public void setLista(HashMap<String, String> listaMAp) {
        this.listaMAp = listaMAp;
    }

    public LibraryCatalog_XML() {

    }
    public void add(Author_EJ10_XML autor, String book){
        listaMAp.put(String.valueOf(autor.getName()),String.valueOf(book));
    }
}
