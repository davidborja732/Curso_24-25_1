package Ejercicio_4;

public class Main {
    public static void main(String[] args) {
        Publicacion[] publicacions={
                new Libro("El señor de los anillos","Tolkien",876),
                new Libro("El señor de los anillos: Las dos torres","Tolkien",916),
                new Revista("Hola","Grupo Publicacion",56),
                new Revista("Clan","RTVE",90),
                new Publicacion("Harry Potter","JK Rowling")
        };
        for (Publicacion publi:publicacions){
            if (publi instanceof Libro) {
                System.out.println(((Libro) publi).mostrarinformacion());
            } else if (publi instanceof Revista) {
                System.out.println(((Revista) publi).mostrarinformacion());
            } else {
                System.out.println(publi.mostrarinformacion());
            }
        }
    }
}
