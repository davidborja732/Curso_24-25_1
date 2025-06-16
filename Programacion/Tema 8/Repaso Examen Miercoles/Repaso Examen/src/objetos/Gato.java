package objetos;

public class Gato implements interfaz{
    String nombre;

    public Gato(String nombre) {
        this.nombre = nombre;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @Override
    public void hacersonido() {
        interfaz.super.hacersonido();{
            System.out.println("Miau Miau");
        }
    }
}
