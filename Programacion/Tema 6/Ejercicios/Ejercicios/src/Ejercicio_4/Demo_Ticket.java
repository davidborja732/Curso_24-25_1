package Ejercicio_4;

public class Demo_Ticket {
    public static void main(String[] args) {
        Ticket ticket1=new Ticket();
        Producto producto1 =new Producto("Sandia",4, 2.50,0.20);
        Producto producto2 =new Producto("Melon",2, 3.50,0.20);
        Producto producto3 =new Producto("Agua",4, 0.50,0.15);
        Producto producto4 =new Producto("Colonia",1, 21.50,0.21);
        System.out.println(producto3.calcularcostesiniva());
        System.out.println(producto3.calcularcosteconiva());
        ticket1.getListaproductos().add(producto1);
        ticket1.getListaproductos().add(producto2);
        ticket1.getListaproductos().add(producto3);
        ticket1.getListaproductos().add(producto4);
        System.out.println(ticket1.calcularprecioticketsiniva());
        System.out.println("El precio con iva es "+ticket1.calcularprecioticketconiva());

    }
}
