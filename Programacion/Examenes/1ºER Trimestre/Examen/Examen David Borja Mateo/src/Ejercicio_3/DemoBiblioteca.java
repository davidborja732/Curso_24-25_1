package Ejercicio_3;

import java.time.LocalDate;

public class DemoBiblioteca {
    public static void main(String[] args) {
        //creo la biblioteca
        Biblioteca biblioteca=new Biblioteca();
        //Creo los libros
        Libro l1=new Libro("El señor de los anillos");
        Libro l2=new Libro("Divergente","Desconocido");
        Libro l3=new Libro("Los juegos del hambre","Suzanne Collins","796467878YT", LocalDate.parse("2010-08-12"),"Fantasia",21.99);
        Libro l4=new Libro("Los juegos del hambre: en llamas","Suzanne Collins","020937878YT", LocalDate.parse("2012-09-12"),"Fantasia,Terror",25.99);
        Libro l5=new Libro("Los juegos del hambre: sinsajo","Suzanne Collins","788554488YT", LocalDate.parse("2015-09-12"),"Fantasia,juvenil",15.99);
        //añado los libros
        biblioteca.añadirlibros(l1);
        biblioteca.añadirlibros(l2);
        biblioteca.añadirlibros(l3);
        biblioteca.añadirlibros(l4);
        biblioteca.añadirlibros(l5);
        //uso el metodo mostrar
        biblioteca.mostrar();
        //uso los metodos de precio_promedio y LibroMasAntiguo
        System.out.println(biblioteca.Precio_Promedio());
        System.out.println(biblioteca.LibroMasAntiguo());
        biblioteca.buscar();
        System.out.println(" ");
        //Añado un libro nuevo
        Libro l6=new Libro("Los juegos del hambre: Comienzos","Suzanne Collins","4565478YT", LocalDate.parse("2017-09-12"),"Fantasia,juvenil,accion",18.99);
        //ñado el libro nuevo
        biblioteca.añadirlibros(l6);
        //muestro la lista para saber si se ha metido el ultimo libro creado
        biblioteca.mostrar();
    }
}
