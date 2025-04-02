package Ejercicio_2;

import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;

import java.util.ArrayList;
@XmlRootElement
public class Lista_productos {
    public ArrayList<Productos> listaproductos=new ArrayList<>();
    @XmlElement
    public ArrayList<Productos> getProductos() {
        return listaproductos;
    }

    public void setProductos(ArrayList<Productos> productos) {
        this.listaproductos = listaproductos;
    }

    public Lista_productos() {
    }
    public void add(Productos producto){
        listaproductos.add(producto);
    }
}
