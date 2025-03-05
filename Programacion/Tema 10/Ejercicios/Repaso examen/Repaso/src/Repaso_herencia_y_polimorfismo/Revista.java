package Repaso_herencia_y_polimorfismo;

public class Revista extends Publicacion{
    private int numero_edicion;

    public Revista(String titulos, String autor, int numero_edicion) {
        super(titulos, autor);
        this.numero_edicion = numero_edicion;
    }

    public int getNumero_edicion() {
        return numero_edicion;
    }

    public void setNumero_edicion(int numero_edicion) {
        this.numero_edicion = numero_edicion;
    }
    @Override
    public String mostrar_informacion() {
        return super.mostrar_informacion()+" numero edicion "+numero_edicion;
    }
}
