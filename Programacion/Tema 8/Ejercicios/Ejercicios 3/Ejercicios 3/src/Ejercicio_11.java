public class Ejercicio_11 {
    public static void main(String[] args) {
        String texto="Para          añadir    texto a            un archivo existente en Java, se puede utilizar              la clase BufferedWriter junto con el constructor de FileWriter que acepta un parámetro true para habilitar el modo de añadir.";
        String reemplazo=texto.replaceAll("\\s+"," ");
        System.out.println(texto);
        System.out.println(reemplazo);
    }
}
