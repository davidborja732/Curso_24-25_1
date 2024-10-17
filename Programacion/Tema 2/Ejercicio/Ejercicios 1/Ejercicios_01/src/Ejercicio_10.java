public class Ejercicio_10 {
    public static void main(String[] args) {
        int resultado=(int)(Math.random()*26+65);
        char letra = (char)resultado;
        Boolean vocal=(resultado==65)||(resultado==69)||(resultado==73)||(resultado==79)||(resultado==85);
        Boolean novocal=(vocal==false);
        System.out.println("La letra "+letra+" es ");
        System.out.println("Vocal "+vocal);
        System.out.println("Consonante "+novocal);
    }
}
