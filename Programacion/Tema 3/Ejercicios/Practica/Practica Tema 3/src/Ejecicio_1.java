import java.util.Scanner;

public class Ejecicio_1 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int numero;

        do {
            System.out.print("Introduce un número ");
            while (!scanner.hasNextInt()) {
                System.out.println("Has introducido otro caracter ");
                scanner.next();
                System.out.print("Introduce un número entero ");
            }

            numero = scanner.nextInt();

            if (numero >= 0) {
                int suma = sumarCifras(numero);
                System.out.println(suma);
            }

        } while (numero >= 0);
    }
    public static int sumarCifras(int numero) {
        int suma = 0;
        while (numero != 0) {
            suma += numero % 10;
            numero /= 10;
        }

        return suma;
    }
}

//Pseudocodigo
/**
 INICIO
 // Inicializa variables
 numero <- 0

 // Bucle principal
 HACER
 IMPRIMIR "Introduce un número entero (un número negativo para salir): "
 LEER numero

 SI numero >= 0 ENTONCES
 suma <- sumarCifras(numero)
 IMPRIMIR "La suma de las cifras es: " + suma
 FIN SI
 MIENTRAS numero >= 0

 IMPRIMIR "Programa terminado."

 // Función para sumar las cifras de un número
 FUNCION sumarCifras(numero)
 INICIO
 suma <- 0

 // Sumar las cifras del número
 MIENTRAS numero != 0
 suma <- suma + (numero % 10)  // Añadir el dígito menos significativo
 numero <- numero / 10         // Eliminar el dígito menos significativo
 FIN MIENTRAS

 RETORNAR suma
 FIN
 FIN

 */
