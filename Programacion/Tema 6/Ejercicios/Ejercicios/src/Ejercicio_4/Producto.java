package Ejercicio_4;

public class Producto {
    String nombre;
    int unidades;
    double precio;
    double iva;

    public Producto() {
    }

    public Producto(String nombre, int unidades, double precio, double iva) {
        this.nombre = nombre;
        this.unidades = unidades;
        this.precio = precio;
        this.iva = iva;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getUnidades() {
        return unidades;
    }

    public void setUnidades(int unidades) {
        this.unidades = unidades;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public double getIva() {
        return iva;
    }

    public void setIva(int iva) {
        this.iva = iva;
    }

    @Override
    public String toString() {
        return "Informacion Producto= "+"\n"+
                "Nombre= "+nombre +"\n"+
                "unidades= "+unidades +"\n"+
                "Precio= "+precio +"\n"+
                "IVA= "+iva+"%";
    }
    public double calcularcostesiniva(){
        return this.unidades* this.precio;
    }
    public double calcularcosteconiva(){
        double iva=calcularcostesiniva()*this.iva;
        return (this.unidades* this.precio)+iva;
    }
}
