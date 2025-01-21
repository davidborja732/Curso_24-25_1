public class Ejercicio_21 {
    public static void main(String[] args) {
        String frase ="La TempEratura es veinte grados y la humedad es de un ochenta o Menos";
        System.out.println(frase);
        String regex="[AEIOUaeiou]";
        String sustituyo=frase.replaceAll(regex,"*");
        System.out.println(sustituyo);
    }
}
