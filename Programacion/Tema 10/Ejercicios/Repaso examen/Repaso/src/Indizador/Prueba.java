package Indizador;

public class Prueba {
    public static void main(String[] args) throws Exception {
        Notas notas=new Notas(4);
        notas.SetCalificacion(0,10);
        notas.SetCalificacion(1,9);
        notas.SetCalificacion(2,2);
        notas.SetCalificacion(3,6);
        notas.SetCalificacion(9,6);
        System.out.println(notas.getCalificacion(90));

    }
}
