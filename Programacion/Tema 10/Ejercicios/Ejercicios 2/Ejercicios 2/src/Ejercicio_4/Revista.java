package Ejercicio_4;

public class Revista extends Publicacion{
    private int numeroedidcion;

    public Revista(String titulo, String autor, int numeroedidcion) {
        super(titulo, autor);
        this.numeroedidcion = numeroedidcion;
    }

    public int getNumeroedidcion() {
        return numeroedidcion;
    }

    public void setNumeroedidcion(int numeroedidcion) {
        this.numeroedidcion = numeroedidcion;
    }

}
