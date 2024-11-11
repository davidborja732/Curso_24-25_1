import java.util.Arrays;

import static java.lang.Math.*;

public class Ejercicio_11 {
    public static void main(String[] args) {
        int[] lista = new int[10];
        for (int i = 0; i < 10; i++) {
            boolean repetido;
            int numero;
            do {
                repetido = false;
                numero = (int) (floor(random() * 21) - 10);
                for (int j = 0; j < i; j++) {
                    if (lista[j] == numero) {
                        repetido = true;
                        break;
                    }
                }
            } while (repetido);
            lista[i] = numero;
        }
        System.out.println(Arrays.toString(lista));
    }
}
