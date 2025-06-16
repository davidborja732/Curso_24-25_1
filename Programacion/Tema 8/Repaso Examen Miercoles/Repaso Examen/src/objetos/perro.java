package objetos;

public class perro implements interfaz {
    String nombre;

    public perro(String nombre) {
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
            System.out.println("Guau Guau");
        }
    }
}
