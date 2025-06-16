package objetos;

public class main {
    public static void main(String[] args) {
        Gato gato=new Gato("michi");
        perro perro=new perro("Perrete");
        gato.hacersonido();
        perro.hacersonido();
        String texto="Hola";
        StringBuilder stringBuilder=new StringBuilder(texto);
        System.out.println(stringBuilder.append(" que tal"));
    }
}
