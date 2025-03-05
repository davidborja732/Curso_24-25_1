package Repaso_herencia_y_polimorfismo;

import java.util.ArrayList;

public class Test {
    public static void main(String[] args) {
        ArrayList<Publicacion> lista = new ArrayList<>();
        Publicacion libro1 = new Libor("El Quijote", "Miguel de Cervantes", 850);
        Publicacion libro2 = new Libor("1984", "George Orwell", 328);

        // Crear dos revistas
        Publicacion revista1 = new Revista("National Geographic", "Varios autores", 202);
        Publicacion revista2 = new Revista("TIME", "Varios autores", 1503);
        lista.add(libro1);
        lista.add(libro2);
        lista.add(revista1);
        lista.add(revista2);
        for (Publicacion publicacion:lista){
            System.out.println(publicacion.mostrar_informacion());
        }

    }
}
