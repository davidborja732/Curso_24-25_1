package Repaso_herencia_y_polimorfismo;

public class Publicacion {
    private String titulos;
    private String autor;

    public Publicacion(String titulos, String autor) {
        this.titulos = titulos;
        this.autor = autor;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public String getTitulos() {
        return titulos;
    }

    public void setTitulos(String titulos) {
        this.titulos = titulos;
    }
    public String mostrar_informacion(){
        return "Autor "+autor+" Libro "+titulos;
    }
}
