package Ejercicio_3;

import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.Scanner;

public class Biblioteca {
    private ArrayList<Libro> listalibros;

    public Biblioteca() {
        this.listalibros = new ArrayList<>();
    }
    public ArrayList<Libro> getListalibros() {
        return listalibros;
    }
    public void mostrar(){
        for (Libro libro:this.listalibros){
            System.out.println(libro);
        }
    }
    public double Precio_Promedio(){
        double suma=0;
        for (Libro libro:this.listalibros){
            //compruebo que el libro tiene precio
            if (libro.getPrecio()!=0){
                suma+= libro.getPrecio();
            }
        }
        return suma/this.listalibros.size();
    }
    public String LibroMasAntiguo(){
        Libro LibroMasAntigua = null;
        int periodomenor=0;
        for (Libro libro:this.listalibros){
            //compruebo que el libro tiene fecha de publicacion
            if (libro.getFecha_publicacion()!=null){
                //compruebo el periodo entre la fecha de publicacion y la actual;
                int fechaantigua=Period.between(libro.getFecha_publicacion(),LocalDate.now()).getYears();
                if (periodomenor<fechaantigua){
                    LibroMasAntigua=libro;
                    periodomenor=fechaantigua;
                }
            }
        }
        return String.valueOf(LibroMasAntigua);
    }
    public void añadirlibros(Libro libro){
        this.listalibros.add(libro);
    }
    public void buscar(){
        Scanner scanner=new Scanner(System.in);
        System.out.println("Dime que quieres Buscar ");
        String buscado= scanner.nextLine();
        // Aqui compruebo que los campos no esten vacios y en caso de no estarlo compruebo si lo que he buscado coincide en alguno de los libros ya creados
        for (Libro libro:this.listalibros){
            if (!(libro.getAutor()==null) && libro.getTitulo().equals(buscado)){
                    System.out.println(libro);
            }else if (!(libro.getAutor()==null) && libro.getAutor().equals(buscado)) {
                System.out.println(libro);
            } else if (!(libro.getGenero()==null) && libro.getGenero().equals(buscado)) {
                System.out.println(libro);
            }
        }
    }
}
