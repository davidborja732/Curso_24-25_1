package Ejercicio_5;

public class Main {
    public static void main(String[] args) {
        Usuario user1=new Usuario("usuario1","Klongitud89");
        Usuario user2=new Usuario("usuario2","Contra123");
        System.out.println(user2.verificar_contrasseña("Contra123"));
        System.out.println(user2.modificar_contraseña("Pruebaoi12"));
        System.out.println(user2.verificar_contrasseña("Pruebaoi12"));
    }
}
