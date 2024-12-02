package Ejercicio_4;

import java.util.ArrayList;

public class Ticket{
    ArrayList<Producto> listaproductos;

    public Ticket() {
        this.listaproductos=new ArrayList<>();
    }

    public Ticket(ArrayList listaproductos) {
        this.listaproductos = listaproductos;
    }

    public ArrayList getListaproductos() {
        return listaproductos;
    }

    public void setListaproductos(ArrayList listaproductos) {
        this.listaproductos = listaproductos;
    }
    public double calcularprecioticketsiniva(){
        double preciosiniva=0.0;
        for (Producto producto:listaproductos){
            preciosiniva+=producto.calcularcostesiniva();
        }
        return preciosiniva;
    }
    public double calcularprecioticketconiva(){
        double precioconiva =0.0;
        for (Producto producto:listaproductos){
            precioconiva+=producto.calcularcostesiniva()+((producto.unidades+producto.precio)*21)/100;
        }
        return precioconiva;
    }
    public void Mostrar(){
        for (Producto producto:listaproductos){
            System.out.println(producto);
        }
    }
}
