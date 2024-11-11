public class Ejercicio_31 {
    public static void main(String[] args) {
        int numero;
        int respuestamax=0;
        int respuestamin=2147483647;
        for (int i =0;i<=10;i++) {
            numero= (int) (Math.random()*100);
            System.out.println(numero);
            if (respuestamax < numero) {
                respuestamax = numero;
            }
            if (numero < respuestamin) {
                respuestamin = numero;
            }
        }
        System.out.println("Valor Maximo "+respuestamax);
        System.out.println("Valor Minimo "+respuestamin);
    }
}
