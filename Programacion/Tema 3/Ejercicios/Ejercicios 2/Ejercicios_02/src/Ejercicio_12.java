//Crea un programa que escriba el alfabeto inglés en mayúsculas A-Z (sin la ñ,
//claro está) utilizando un bucle y la conversión ASCII.
public class Ejercicio_12 {
    public static void main(String[] args) {
        char caracter;
        for (int i=65;i<=90;i++){
            caracter=(char) i;
            System.out.println(caracter);
        }
    }
}
